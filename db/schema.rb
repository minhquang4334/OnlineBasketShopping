# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_11_095638) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "colors", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "comment"
    t.bigint "model_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_comments_on_model_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "detail_models", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "price"
    t.integer "quantity"
    t.bigint "size_id"
    t.bigint "color_id"
    t.bigint "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_detail_models_on_color_id"
    t.index ["model_id"], name: "index_detail_models_on_model_id"
    t.index ["size_id"], name: "index_detail_models_on_size_id"
  end

  create_table "models", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
  end

  create_table "order_details", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "order_id"
    t.bigint "detail_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["detail_model_id"], name: "index_order_details_on_detail_model_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "status"
    t.string "address"
    t.integer "phone_number"
    t.integer "payment_id"
    t.string "receive_name"
    t.bigint "payment_type_id"
    t.bigint "shipping_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["payment_type_id"], name: "index_orders_on_payment_type_id"
    t.index ["shipping_type_id"], name: "index_orders_on_shipping_type_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_types", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "payment_type"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_questions_on_admin_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "shipping_types", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "shipping_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.string "address"
    t.string "picture"
    t.string "phone"
    t.boolean "gender"
    t.date "birthday"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "models"
  add_foreign_key "comments", "users"
  add_foreign_key "detail_models", "colors"
  add_foreign_key "detail_models", "models"
  add_foreign_key "detail_models", "sizes"
  add_foreign_key "order_details", "detail_models"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "payment_types"
  add_foreign_key "orders", "shipping_types"
  add_foreign_key "orders", "users"
  add_foreign_key "questions", "users"
end
