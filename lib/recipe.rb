class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :combos
  has_many :ingredients, through: :combos

  def not_ingredients
    all_ingredients = Ingredient.all()
    recipe_ingredients = self.ingredients()
    not_ingredients = all_ingredients - recipe_ingredients
  end

  def not_tags
    all_tags = Tag.all()
    recipe_tags = self.tags()
    not_tags = all_tags - recipe_tags
  end

  def self.teardown
    Rake::Task['db:drop'].invoke
  end

end
# rake db:drop db:create db:migrate db:test:prepare
