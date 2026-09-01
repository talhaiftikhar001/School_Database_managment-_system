# School Database Management System

A full-stack School Database Management System built with **Flask** and **PostgreSQL**, designed for **Vercel** deployment.

## Features

- **Admin Dashboard**: Manage students, teachers, classes, sections, subjects, exams, fees, and admins
- **Teacher Portal**: Mark attendance, assign grades, view students
- **Role-Based Access**: Admin and Teacher roles with PIN-based registration
- **Fee Management**: Track unpaid fees, generate fee slips, manage overdue students

## Tech Stack

| Component | Technology |
|-----------|------------|
| Backend | Flask (Python) |
| Database | PostgreSQL (Supabase) |
| Deployment | Vercel (Serverless Functions) |

## Setup

### 1. Database Setup (Supabase)

1. Create a free account at [supabase.com](https://supabase.com)
2. Create a new project
3. Go to **SQL Editor** and run the contents of `db_schema.sql`
4. Copy your **DATABASE_URL** from Settings > Database > Connection string (URI)

### 2. Local Development

```bash
pip install -r requirements.txt
```

Set environment variable:
```bash
export DATABASE_URL="your_supabase_connection_string"
```

Run locally:
```bash
cd api
python index.py
```

### 3. Deploy to Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. Run `vercel` in the project root
3. Add environment variable `DATABASE_URL` in Vercel Dashboard > Settings > Environment Variables
4. Deploy: `vercel --prod`

## Default Login

After running the schema, a default admin account is created:
- **Email**: admin@school.com
- **Password**: admin123
- **PIN for signup**: `0000` (admin), `1111` (teacher)

## Project Structure

```
├── api/
│   └── index.py          # Flask serverless function
├── templates/             # HTML templates
├── vercel.json            # Vercel configuration
├── requirements.txt       # Python dependencies
├── db_schema.sql          # PostgreSQL schema
└── README.md
```
