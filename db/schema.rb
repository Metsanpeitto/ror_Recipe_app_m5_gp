
ActiveRecord::Schema.define(version: 2021_11_15_161749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "measurement_unit"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "foods_inventories", id: false, force: :cascade do |t|
    t.bigint "inventory_id", null: false
    t.bigint "food_id", null: false
    t.index ["inventory_id", "food_id"], name: "index_foods_inventories_on_inventory_id_and_food_id"
  end

  create_table "foods_recipes", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "food_id", null: false
    t.integer "quantity", default: 0, null: false
    t.index ["recipe_id", "food_id"], name: "index_foods_recipes_on_recipe_id_and_food_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.text "description"
    t.boolean "public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "foods", "users"
  add_foreign_key "inventories", "users"
  add_foreign_key "recipes", "users"
end
