# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_21_003247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "job_views", force: :cascade do |t|
    t.integer "job_id"
    t.integer "viewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views"
    t.integer "user_id"
    t.datetime "published_at"
    t.datetime "published_notice_sent_at"
    t.string "cached_slug"
    t.string "company"
    t.string "salary"
    t.index ["cached_slug"], name: "index_jobs_on_cached_slug"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.text "body_html"
    t.string "title"
    t.datetime "published_at"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redirects", id: { type: :string, limit: 32 }, force: :cascade do |t|
    t.string "url", limit: 2083
    t.datetime "last_visited_at"
    t.integer "visits", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slugs", force: :cascade do |t|
    t.string "scope"
    t.string "slug"
    t.integer "record_id"
    t.datetime "created_at"
    t.index ["scope", "record_id", "created_at"], name: "index_slugs_on_scope_and_record_id_and_created_at"
    t.index ["scope", "record_id"], name: "index_slugs_on_scope_and_record_id"
    t.index ["scope", "slug", "created_at"], name: "index_slugs_on_scope_and_slug_and_created_at"
    t.index ["scope", "slug"], name: "index_slugs_on_scope_and_slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewers", force: :cascade do |t|
    t.string "client_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
