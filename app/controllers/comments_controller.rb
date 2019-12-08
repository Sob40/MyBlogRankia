class CommentsController < ApplicationController
    http_basic_authenticate_with name: "usuario", password: "secret",
    only: :destroy
    def create
        #Creamos una instancia de la consulta find recuperando la id del articulo. al no encontrarnos en articulos especificamos article_id
        @article = Article.find(params[:article_id])
        # Cremaos la instancia del comentario. 
        # Al crear la relacion (Articulos - Comentarios) nosotros creamos un array para cada articulo y le llamamos comments
        @comment = @article.comments.create(comment_params)
        #Redirigimos al articulo enviandole la instacia de el articulo
        redirect_to article_path(@article)
    end

    def destroy
        #Recuperamos el articulo para obtener sus comentarios
        @article = Article.find(params[:article_id])
        #Obtenemos el comentario que queremos eliminar
        @comment = @article.comments.find(params[:id])
        #Eliminamos el comentario
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        # Recuperamos la informacion del formulario mediante un metodo privado
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
