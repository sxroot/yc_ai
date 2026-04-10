-- ============================================
-- YOUR CHOICE AI — Database Setup
-- Run this SQL in your Hostinger PostgreSQL database
-- ============================================

CREATE TABLE IF NOT EXISTS "contacts" (
  "id" serial PRIMARY KEY,
  "name" text NOT NULL,
  "email" text NOT NULL,
  "phone" text,
  "business_type" text,
  "message" text NOT NULL,
  "status" text NOT NULL DEFAULT 'new',
  "admin_notes" text,
  "created_at" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS "bookings" (
  "id" serial PRIMARY KEY,
  "name" text NOT NULL,
  "email" text NOT NULL,
  "phone" text,
  "business_type" text,
  "preferred_date" text,
  "preferred_time" text,
  "notes" text,
  "status" text NOT NULL DEFAULT 'pending',
  "created_at" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS "testimonials" (
  "id" serial PRIMARY KEY,
  "name" text NOT NULL,
  "role" text,
  "company" text,
  "content" text NOT NULL,
  "rating" integer NOT NULL DEFAULT 5,
  "image_url" text,
  "display_order" integer NOT NULL DEFAULT 0,
  "is_published" boolean NOT NULL DEFAULT true,
  "created_at" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS "faqs" (
  "id" serial PRIMARY KEY,
  "question" text NOT NULL,
  "answer" text NOT NULL,
  "category" text NOT NULL DEFAULT 'general',
  "display_order" integer NOT NULL DEFAULT 0,
  "is_published" boolean NOT NULL DEFAULT true,
  "created_at" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS "cms_content" (
  "section_key" text PRIMARY KEY,
  "content" text NOT NULL,
  "is_draft" boolean NOT NULL DEFAULT false,
  "updated_at" timestamp NOT NULL DEFAULT now()
);
