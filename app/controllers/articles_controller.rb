class ArticlesController < ApplicationController

    #Autenticacion basica en la que indicamos mediante except las que no necesitan autenticación
    http_basic_authenticate_with name: "usuario", password: "secret",
    except: [ :index, :show ]
    #Mostramos todos los articulos
    def index
        @articles = Article.all
    end

    #Mostramos un articulo en concreto
    def show
        @article  = Article.find(params[:id])
    end

    #Funcions que 
    def new
        # Nos permite guardar una instacia que en caso de entrar por primera vez lo crea vacio pero si falla el save mantiene la información
        @article = Article.new
    end

    #Función que nos a renderizar el articulo que queremos editar 
    def edit
        @article =  Article.find(params[:id])
    end

    #Función para crear un articulos
    def create
        #Inicializa el modelo con sus atributos
        #Params contiene los atributos - @articulo es la instancina y Articulo el modelo.        
        @article = Article.new(article_params)

        #Guardar el modelo en la BD y devuelve un boolean si el articulo ha sido guardado o no
        if @article.save
            #Redireccionamos al usuario a la accion del #show
            redirect_to @article
        else
            #En caso de un error al guardar iriamos a la instacia new manteniedo la información que estabamos creando, 
            #en caso de no hacerlo se perderia la informacio escrita.
            render 'new'
        end
    end

    #Función para editar un articulos
    def update

        #buscamos el articulo apartir de la id
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    #Función para eliminar un articulos
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    
    end

    # Los parametros los requeriremos desde un metodo privado para seguridad
    private 
        def article_params
            #params.require(:article).permit(:title, :text)
            #Por integridad de la base de datos añadiremos los atributos individualmente, tambien nos permite una mayor seguridad.
            params.require(:article).permit(:title, :text)       
        end
end
