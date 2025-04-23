class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
    @document_types = Document::DOCUMENT_TYPES
  end

  def create
    @document = Document.new(document_params)
    
    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      @document_types = Document::DOCUMENT_TYPES
      render :new
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def generate
    document_type = params[:document_type]
    parameters = params[:parameters]

    content = Document.generate_content(document_type, parameters)
    
    @document = Document.create!(
      title: "#{document_type} - #{Time.current.strftime('%Y-%m-%d')}",
      content: content,
      document_type: document_type,
      status: 'generated',
      metadata: parameters
    )

    redirect_to @document, notice: 'Document was successfully generated.'
  rescue => e
    redirect_to new_document_path, alert: "Error generating document: #{e.message}"
  end

  def download
    @document = Document.find(params[:id])
    
    pdf = Prawn::Document.new do |pdf|
      # Add a title
      pdf.text @document.title, size: 20, style: :bold, align: :center
      pdf.move_down 20

      # Add the content
      pdf.text @document.content
    end

    send_data pdf.render,
              filename: "#{@document.title.parameterize}.pdf",
              type: 'application/pdf',
              disposition: 'attachment'
  end

  private

  def document_params
    params.require(:document).permit(:title, :content, :document_type, :status, metadata: {})
  end
end
