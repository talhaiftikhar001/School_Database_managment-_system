# School Database Management System

A full-stack School Database Management System built with **Flask** and **PostgreSQL**, specially configured for **Vercel** serverless deployment.

## Features
- **Admin Dashboard**: Manage students, teachers, classes, sections, subjects, exams, fees, and admins.
- **Teacher Portal**: Mark attendance, assign grades, view students.
- **Role-Based Access**: Admin and Teacher roles with PIN-based registration.
- **Fee Management**: Track unpaid fees, generate fee slips, manage overdue students.

## Tech Stack
- **Backend**: Flask (Python) via Vercel Serverless Functions
- **Database**: PostgreSQL (via Supabase)
- **Deployment**: Vercel

---

## 🚀 Deployment Guide (How to Deploy to Vercel)

This project has been configured to deploy seamlessly on Vercel. Follow these steps to get your app live.

### Step 1: Set up the Database (Supabase)
Since Vercel is a serverless platform, it cannot host a traditional SQL Server. We use **Supabase (PostgreSQL)** which is free and works perfectly with Vercel.

1. Go to [Supabase](https://supabase.com) and create a free account.
2. Click **New Project** and set it up (save the database password somewhere safe).
3. Once the project is created, go to the **SQL Editor** from the left menu.
4. Copy the entire code from the `db_schema.sql` file in this repository.
5. Paste it into the SQL Editor and click **Run**. This will create all your tables and insert the default Admin account.
6. Now, go to **Project Settings** (gear icon) > **Database**.
7. Scroll down to **Connection String** -> **URI**.
8. Copy that URL. It looks something like this:
   `postgresql://postgres:[YOUR-PASSWORD]@db.xxxx.supabase.co:5432/postgres`
   *(Replace `[YOUR-PASSWORD]` with the password you created in step 2)*

### Step 2: Deploy to Vercel

1. Go to [Vercel](https://vercel.com) and log in with your GitHub account.
2. Click **Add New...** > **Project**.
3. Import this GitHub repository (`School_Database_managment-_system`).
4. In the "Configure Project" screen, expand the **Environment Variables** section.
5. Add the following:
   - **Name**: `DATABASE_URL`
   - **Value**: *(Paste the Supabase connection string you copied in Step 1)*
6. Click **Deploy**.

Vercel will now install the dependencies (Flask, Psycopg2) and deploy your app. Once done, it will give you a live URL!

---

## Default Login Credentials
After running the SQL script in Step 1, a default admin account is created for you:

- **Email**: `admin@school.com`
- **Password**: `admin123`

### Registration PINs
If you want to create a new account from the signup page, use these PINs:
- **Admin PIN**: `0000`
- **Teacher PIN**: `1111`

---

## Local Development (For testing on your computer)

1. Clone the repo.
2. Install requirements:
   ```bash
   pip install -r requirements.txt
   ```
3. Set your Database URL environment variable (in Windows PowerShell):
   ```powershell
   $env:DATABASE_URL="your_supabase_connection_string"
   ```
4. Run the app:
   ```bash
   cd api
   python index.py
   ```
5. Open `http://localhost:5000` in your browser.
