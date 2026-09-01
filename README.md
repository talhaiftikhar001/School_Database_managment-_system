# School Database Management System

A full-stack School Database Management System built with **Flask** and **SQLite**, specially configured for **Vercel** serverless deployment.

## Features
- **Admin Dashboard**: Manage students, teachers, classes, sections, subjects, exams, fees, and admins.
- **Teacher Portal**: Mark attendance, assign grades, view students.
- **Role-Based Access**: Admin and Teacher roles with PIN-based registration.
- **Fee Management**: Track unpaid fees, generate fee slips, manage overdue students.

## Tech Stack
- **Backend**: Flask (Python) via Vercel Serverless Functions
- **Database**: SQLite (In-Memory / Temporary Storage on Vercel)
- **Deployment**: Vercel

---

## 🚀 Deployment Guide (How to Deploy to Vercel)

This project has been configured to deploy seamlessly on Vercel with a temporary SQLite database.

> **Important Note about SQLite on Vercel**: 
> Vercel is a serverless platform. Because we are using SQLite, the database file is saved in the temporary `/tmp` directory. Vercel automatically spins down serverless functions after a period of inactivity, which means **the database will reset automatically every few hours/minutes**.
> This setup is perfect for **school projects, assignments, and temporary demos**, but should not be used if you want to permanently save data.

### Deploy to Vercel

1. Go to [Vercel](https://vercel.com) and log in with your GitHub account.
2. Click **Add New...** > **Project**.
3. Import this GitHub repository (`School_Database_managment-_system`).
4. Click **Deploy**.

Vercel will install the dependencies (Flask) and deploy your app. Once done, it will give you a live URL!

The database will be automatically initialized the first time you visit the deployed site.

---

## Default Login Credentials
Upon the first run, a default admin account is automatically created for you:

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
3. Run the app:
   ```bash
   cd api
   python index.py
   ```
4. Open `http://localhost:5000` in your browser.
*(On local machine, the database will be saved permanently as `school.db` in the root folder).*
