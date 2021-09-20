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

ActiveRecord::Schema.define(version: 2021_09_20_051847) do

 # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

<<<<<<< HEAD
=======

>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
  create_table "features", force: :cascade do |t|
    t.string "name"
    t.float "code"
    t.integer "unit_price"
    t.integer "max_unit_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "plan_id"
    t.integer "total_amount", null: false
    t.index ["plan_id"], name: "index_features_on_plan_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "payment"
    t.integer "plan_id", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.date "next_billing_day", default: "2021-09-17", null: false
    t.date "billing_day", default: "2021-10-18", null: false
<<<<<<< HEAD
=======

>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "payments_and_plans_ids", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "payment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_id"], name: "index_payments_and_plans_ids_on_payment_id"
    t.index ["plan_id"], name: "index_payments_and_plans_ids_on_plan_id"
  end

  create_table "plan_usage", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false
    t.string "plan_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plan_usages", force: :cascade do |t|
    t.string "plan_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "users_name", default: "", null: false
    t.string "features_name", default: "", null: false
    t.string "amount", default: "0", null: false
    t.integer "max_unit_limit", default: 0, null: false
    t.string "increased_units", default: "1", null: false
    t.bigint "user_id", default: 0, null: false
    t.index ["user_id"], name: "index_plan_usages_on_user_id"
<<<<<<< HEAD
  end
=======
 end
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "monthly_fee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "plan_id"
    t.integer "status", default: 0, null: false
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "userType", default: "buyer", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
<<<<<<< HEAD
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
=======
   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
  end

  add_foreign_key "features", "plans"
  add_foreign_key "payments_and_plans_ids", "payments"
  add_foreign_key "payments_and_plans_ids", "plans"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "subscriptions", "users"
end
