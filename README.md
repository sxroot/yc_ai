# Your Choice AI — Hostinger Deployment Guide

## What's Included

```
your-choice-ai/
  index.mjs                  ← Main server (API + frontend combined)
  pino-worker.mjs            ← Logger worker
  pino-file.mjs              ← Logger file worker
  pino-pretty.mjs            ← Logger formatter
  thread-stream-worker.mjs   ← Logger thread worker
  public/                    ← Frontend static files (HTML/CSS/JS)
  package.json               ← Node.js app config
  .env.example               ← Environment variable template
  setup.sql                  ← Database setup script
```

---

## Step 1 — Set Up a PostgreSQL Database on Hostinger

1. Log in to Hostinger → go to **Hosting** → your plan → **Databases**
2. Create a new **PostgreSQL** database, and note down:
   - Database name
   - Database user
   - Password
   - Host (usually `localhost` or an internal hostname)
3. Open the database using **phpPgAdmin** or any SQL client
4. Run the contents of `setup.sql` — this creates all required tables

---

## Step 2 — Set Up a Node.js App on Hostinger

1. In Hostinger, go to **Hosting** → your plan → **Node.js**
2. Click **Create Application**
3. Set the **Node.js version** to **18** or higher
4. Set the **Entry point** to `index.mjs`
5. Set the **Application root** to wherever you upload the files (e.g. `/home/user/your-choice-ai`)
6. Click **Create**

---

## Step 3 — Upload the Files

Upload the entire contents of this `your-choice-ai/` folder to your Node.js app root on Hostinger using:
- Hostinger File Manager, or
- FTP (FileZilla, etc.)

**Important**: Upload ALL files including the `public/` folder and the `*.mjs` files.

---

## Step 4 — Set Environment Variables

In Hostinger → Node.js app → **Environment Variables**, add:

| Variable       | Value                                              |
|----------------|----------------------------------------------------|
| `NODE_ENV`     | `production`                                       |
| `DATABASE_URL` | `postgresql://user:password@localhost:5432/dbname` |
| `ADMIN_SECRET` | A strong secret password of your choice            |
| `PORT`         | Leave blank — Hostinger assigns this automatically |

> **Do NOT** upload the `.env.example` file or a `.env` file with real credentials. Always use the Hostinger environment variable panel.

---

## Step 5 — Start the App

Click **Restart** (or **Start**) in the Node.js panel on Hostinger.  
Your site will be live at your domain!

---

## Admin Panel

Access the admin panel at: `https://yourdomain.com/admin`

Enter the password you set as `ADMIN_SECRET` to log in.

From the admin panel you can:
- View and manage leads (contact form submissions)
- View and manage bookings
- Edit testimonials
- Edit FAQs
- Edit all website content (CMS)

---

## Updating Content (No Code Required)

All website text — hero headline, about section, pricing, contact info, footer — can be edited directly in the admin panel under **Website CMS**. No need to touch code.

---

## Optional: n8n Automation Webhooks

If you use n8n for automation, add these optional environment variables:

| Variable                | Value                                       |
|-------------------------|---------------------------------------------|
| `N8N_CONTACT_WEBHOOK`   | `https://your-n8n.com/webhook/contact`      |
| `N8N_BOOKING_WEBHOOK`   | `https://your-n8n.com/webhook/booking`      |

When set, each new contact form and booking will automatically trigger your n8n workflow.

---

## Troubleshooting

**App won't start**: Check that `NODE_ENV=production` and `DATABASE_URL` are set correctly in Hostinger environment variables.

**Database errors**: Make sure you ran `setup.sql` against your PostgreSQL database.

**404 on page refresh**: This is handled automatically — the server serves `index.html` for all non-API routes, enabling React Router navigation.

**Admin can't log in**: Double-check the `ADMIN_SECRET` environment variable matches what you type in the password field.
