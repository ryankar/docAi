# DocAI

A Rails application for intelligent document processing and analysis.

## Project Configuration

### Environment Details
- Ruby version: 3.2.2
- Rails version: 8.0.2
- Database: PostgreSQL
- Deployment Platform: Heroku

### Development Setup

#### Prerequisites
- Ruby 3.2.2
- PostgreSQL
- WSL (Windows Subsystem for Linux) for Windows users

#### Running the Application
Always run Rails commands through WSL:
```bash
# Start the Rails server
bin/rails server -b 0.0.0.0

# Start Tailwind CSS processing
bin/rails tailwindcss:watch
```

### Database Configuration
- PostgreSQL database is configured in `config/database.yml`
- Database names:
  - Development: `doc_ai_development`
  - Test: `doc_ai_test`
  - Production: Uses `DATABASE_URL` from Heroku

### Frontend Framework
- Tailwind CSS 4.x is integrated
- Assets are processed through Propshaft
- Tailwind configuration is in `app/assets/tailwind/application.css`
- JavaScript handled through importmaps

### Deployment
- Heroku app name: serene-fjord-06849
- URL: https://serene-fjord-06849-e238741ae0ee.herokuapp.com/
- Git remote: `heroku` is configured

#### Deployment Commands
```bash
# Deploy to Heroku
git push heroku main

# Run database migrations
heroku run rails db:migrate

# Restart the application
heroku restart
```

### Project Structure
- Views are in `app/views/`
- Main layout: `app/views/layouts/application.html.erb`
- Homepage: `app/views/home/index.html.erb`
- Styles: `app/assets/tailwind/application.css`

### Current Features
- Modern responsive design with Tailwind CSS
- Navigation bar with home link
- Landing page with hero section
- Database integration
- Production deployment on Heroku

### Development Workflow
1. Make changes locally
2. Test in development using WSL
3. Commit changes:
   ```bash
   git add .
   git commit -m "Description of changes"
   ```
4. Deploy to Heroku:
   ```bash
   git push heroku main
   ```
5. Run migrations if needed:
   ```bash
   heroku run rails db:migrate
   ```

### Important Notes
- Always use WSL for Rails commands on Windows
- Run both Rails server and Tailwind watcher for development
- Database changes require migration in both development and production
- Tailwind CSS changes are automatically compiled in development when the watcher is running
