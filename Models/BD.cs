using System.Data.SqlClient;
using Dapper;
namespace TP07_PreguntadORT;
static class BD{
        private static string _connectionString = @"Server=localhost; DataBase=TP07 - PreguntadORT_DataBase; Trusted_Connection=True;";
public static List<Categoria> ObtenerCategorias(){
        List<Categoria> ListaCategorias = new List<Categoria>();
        string SQL = "SELECT * FROM Categorias";
        using(SqlConnection db =new SqlConnection(_connectionString)){
                ListaCategorias=db.Query<Categoria>(SQL).ToList();
        }
        return ListaCategorias;
}
public static List<Dificultad> ObtenerDificultades(){
        List<Dificultad> ListaDificultad = new List<Dificultad>();
        string SQL = "SELECT * FROM Dificultad";
        using(SqlConnection db =new SqlConnection(_connectionString)){
                ListaDificultad=db.Query<Dificultad>(SQL).ToList();
        }
        return ListaDificultad;
}
public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria){
        List<Pregunta> ListaPreguntas = new List<Pregunta>();
        string SQL = "SELECT * FROM Preguntas WHERE IdCategoria = @categoria2";
        using(SqlConnection db =new SqlConnection(_connectionString)){
                db.Execute(SQL,new{categoria2 = categoria});
        }
        return ListaPreguntas;
}
public static List<Respuesta> ObtenerRespuestas(int idPregunta){
        List<Respuesta> ListaRespuestas = new List<Respuesta>();
        string SQL = "SELECT * FROM Respuestas WHERE IdPregunta = @id";
        using(SqlConnection db =new SqlConnection(_connectionString)){
                db.Execute(SQL,new{} );
        }
        return ListaRespuestas;
}
}