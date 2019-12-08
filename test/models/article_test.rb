require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  #valida que el campo tittle tenga un tamaño mayor de 3
  test "new article has default title" do
    a = Article.new
    assert a.title.length > 3, "Saved the article without a title"
  end

  #valida que el campo tittle tenga un tamaño mayor de 3
  test "new article has empty tittle" do
    article = Article.new(title: '', text: 'Cuerpo del articulo')
    assert article.valid?
  end

  #Este test valida que el campo tittle tenga un tamaño mayor de 3
  test "new article has empty body" do
    article = Article.new(title: 'Titulo', text: '')
    assert article.valid?
  end

  #validamos que podemos insertar un articulo
  test 'valid insert Article' do
    articulo = Article.new(title: 'Titulo de ejemplo', text: 'Cuerpo del articulo')
    assert articulo.valid?
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    some_undefined_variable
    assert true
  end

end
