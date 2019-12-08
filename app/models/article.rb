class Article < ApplicationRecord
    # Un articulo contiene muchos comentarios, e indicamos que los comentarios dependen del articulo
    has_many :comments, dependent: :destroy
    # Validaciones de front    
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 5 }

    
    # Validaciones de prueba
    # Article.create(tittle:"Titulo").valid?
    # Article.create(tittle:nil).valid?
                        
  end
