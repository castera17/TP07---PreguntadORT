using System.Data.SqlClient;
using Dapper;
namespace TP07_PreguntadORT;
static class BD{
        private static string _connectionString = @"Server=localhost; DataBase=BD-PreguntadORT; Trusted_Connection=True;";
public static List<Categoria> ObtenerCategorias(){
        List<Categoria> ObtenerCategorias = new List<Categoria>();
        string SQL = "SELECT Nombre FROM Categorias";
        using(SqlConnection db =new SqlConnection(_connectionString)){
                db.Execute(SQL,new{pIdDeportista = idDeportista} );
        }
}

}