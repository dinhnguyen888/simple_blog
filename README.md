# Blog Application

A Ruby on Rails blog application with user authentication, admin roles, and rich text content support.

## Features

- User authentication (using Devise)
- Role-based authorization (admin/user roles)
- Blog post management with rich text editor
- Comment system
- Cover image upload for blog posts
- Tailwind CSS for styling
- PWA (Progressive Web App) support

## Requirements

- Ruby version: See `.ruby-version` file
- Rails 7+
- PostgreSQL
- Node.js & Yarn for asset compilation

## Setup

1. Clone the repository
2. Install dependencies:
```bash
bundle install
yarn install
```

3. Setup database:
```bash
rails db:create db:migrate db:seed
```

4. Start the development server:
```bash
bin/dev
```

## Admin Access

The following admin accounts are created by default when running `rails db:seed`:

1. Admin Account #1:
   - Email: admin@admin.com
   - Password: admin@123

2. Admin Account #2:
   - Email: nguyenphucdinh89@gmail.com
   - Password: password123

## Development

- Run tests: `rails test`
- Check code style: `bin/rubocop`
- Security analysis: `bin/brakeman`

## Deployment

The application uses Kamal for deployment:

```bash
bin/kamal deploy
```

## Docker Support

Docker configuration is included for containerized development and deployment:

```bash
docker-compose up
