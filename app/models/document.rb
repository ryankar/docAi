class Document < ApplicationRecord
  validates :title, presence: true
  validates :document_type, presence: true
  
  DOCUMENT_TYPES = [
    'Non-Disclosure Agreement',
    'Employment Contract',
    'Service Agreement',
    'Sales Contract',
    'Partnership Agreement',
    'Lease Agreement',
    'Consulting Agreement'
  ]

  def self.generate_content(document_type, parameters)
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    
    prompt = generate_prompt(document_type, parameters)
    
    response = client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You are a professional legal document writer. Create a formal, legally-sound document based on the provided parameters." },
          { role: "user", content: prompt }
        ],
        temperature: 0.7
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  private

  def self.generate_prompt(document_type, parameters)
    case document_type
    when 'Non-Disclosure Agreement'
      "Create a detailed NDA with the following parameters: #{parameters}"
    when 'Employment Contract'
      "Create a comprehensive employment contract with these details: #{parameters}"
    else
      "Create a formal #{document_type} with the following specifications: #{parameters}"
    end
  end
end
