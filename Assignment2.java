import java.sql.*;
import java.util.Date;

// If you are looking for Java data structures, these are highly useful.
// Remember that an important part of your mark is for doing as much in SQL (not Java) as you can.
// Solutions that use only or mostly Java will not received a high mark.  
import java.util.ArrayList; 
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class Assignment2 {

   // A connection to the database
   Connection connection;

   Assignment2() {}

  /**
   * Connects and sets the search path.
   *
   * Establishes a connection to be used for this session, assigning it to
   * the instance variable 'connection'.  In addition, sets the search
   * path to bnb.
   *
   * @param  url       the url for the database
   * @param  username  the username to connect to the database
   * @param  password  the password to connect to the database
   * @return           true if connecting is successful, false otherwise
   */
   public boolean connectDB(String URL, String username, String password) {
      // Implement this method!
      // return false;
      try {
            Class.forName("org.postgresql.Driver");
        }
        catch (ClassNotFoundException e) {
            System.out.println("Failed to find the JDBC driver");
        }
      try {
        connection = DriverManager.getConnection(URL, username, password);
        String set_path = "SET search_path TO bnb";
        PreparedStatement prepared_statement = connection.prepareStatement(set_path);
        prepared_statement.execute();
        return true;
      } catch (SQLException e) {
        e.printStackTrace();
        return false;
      }

   }


  /**
   * Closes the database connection.
   *
   * @return true if the closing was successful, false otherwise
   */
   public boolean disconnectDB() {
      // Implement this method!
      // return false;
      try {
        connection.close();
        return true;
      } 
      catch (SQLException e) { 
        e.printStackTrace();
        return false;
      }
   }

   /** TEST
   *  return all traveler Ids
   *
   */

   public ArrayList<String> selectTravelerId(){

    try{
      ArrayList<String> travelers = new ArrayList<String>();
       
      String queryString = "SELECT travelerId FROM Traveler;";
      PreparedStatement ps = connection.prepareStatement(queryString);

      ResultSet rs = ps.executeQuery();

      while(rs.next()){
        String id = rs.getString("travelerId");
        travelers.add(id);

      }
      System.out.println(travelers);
      return(travelers);
    } catch (SQLException s){
      return new ArrayList<String>();
    }
   }


   /**
    * Returns the 10 most similar homeowners based on traveller reviews. 
    *
    * Does so by using Cosine Similarity: the dot product between the columns
    * representing different homeowners. If there is a tie for the 10th 
    * homeowner (only the 10th), more than 10 records may be returned. 
    *
    * @param  homeownerID   id of the homeowner
    * @return               a list of the 10 most similar homeowners
    */
   public HashMap homeownerRecommendation(int homeownerID) {
      // Implement this method!
                                
      
      try{
        
        HashMap<Integer, HashMap<Integer, Float>> map = new HashMap<Integer, HashMap<Integer, Float>>();
        //ArrayList<String> homeowner = new ArrayList<String>();  
        //int count = selectTravelerID();                         
        String queryString = "CREATE VIEW travelers AS \n"+
"SELECT Traveler.TravelerId, Booking.listingId \n" +
"FROM Traveler LEFT OUTER JOIN Booking ON Traveler.travelerID=Booking.travelerId \n"+
"GROUP BY Traveler.travelerID, Booking.listingID \n"+
"order by traveler.travelerID;\n\n"+ 


"CREATE VIEW average AS \n"+
"SELECT Travelers.TravelerId, travelers.listingId,avg(coalesce(TravelerRating.rating,0)) AS avg \n"+
"FROM Travelers LEFT OUTER JOIN TravelerRating ON TravelerRating.listingID=Travelers.listingId \n"+
"GROUP BY Travelers.travelerID,travelers.listingId \n"+
"order by travelers.travelerID;\n"+

"CREATE VIEW homeowners AS \n"+
"SELECT homeowner.homeownerid,listing.listingid FROM homeowner LEFT OUTER JOIN listing ON listing.owner = homeowner.homeownerid \n"+
"GROUP BY homeowner.homeownerid,listing.listingid;\n \n"+
"CREATE VIEW rating AS \n"+
"SELECT homeowners.homeownerid,average.travelerid,coalesce(average.avg,0)::float as avg \n"+
"FROM homeowners LEFT OUTER JOIN average ON homeowners.listingid = average.listingid \n"+
"GROUP BY homeowners.homeownerid,average.travelerid,average.avg; \n"+
"SELECT * \n"+
 "FROM rating; \n";

 System.out.println(queryString);

      PreparedStatement ps = connection.prepareStatement(queryString);      

      ResultSet rs = ps.executeQuery();
      ResultSetMetaData rsmd = rs.getMetaData();
      System.out.println(rsmd); 

                           

      while(rs.next()){                                       
        int homeowner = rs.getInt("homeownerid"); 
         System.out.println(homeowner);
        int traveler = rs.getInt("travelerid");
         System.out.println(traveler);
        float avg =rs.getFloat("avg");
         System.out.println(avg);

        HashMap<Integer, Float> val = new HashMap<Integer, Float>();
        val.put(traveler,avg);
         System.out.println(val);
        map.put(homeowner,val);                                    

      }
      /*Object scores = map.get(homeownerID); //get the scores for the homeowner specified
      map.remove(homeownerID); //remove that homeowner from hashmap

      Iterator it = map.entrySet().iterator();
      while (it.hasNext()) {

        Map.Entry pair = (Map.Entry)it.next();*/
        System.out.println(map);
        return map;


        

                                           
    } catch (SQLException s){                                 
      return null; 
   }
 }


   /**
    * Records the fact that a booking request has been accepted by a 
    * homeowner. 
    *
    * If a booking request was made and the corresponding booking has not been
    * recorded, records it by adding a row to the Booking table, and returns 
    * true. Otherwise, returns false. 
    *
    * @param  requestID  id of the booking request
    * @param  start      start date for the booking
    * @param  numNights  number of nights booked
    * @param  price      amount paid to the homeowner
    * @return            true if the operation was successful, false otherwise
    */
   public boolean booking(int requestId, Date start, int numNights, int price) {
      // Implement this method!
      return false; 
   }

   public static void main(String[] args) {
  // You can put testing code in here. It will not affect our autotester.

    //HEY SUNNY!: to run this program type 'javac Assignment2.java' in terminal
    //then type 'java -cp /local/packages/jdbc-postgresql/postgresql-9.4.1212.jar: Assignment2'
      Assignment2 a2 = new Assignment2();
      String url = "jdbc:postgresql://localhost:5432/csc343h-steph191";
      a2.connectDB(url,"steph191","");
      
      a2.selectTravelerId();

      a2.homeownerRecommendation(4001);

      a2.disconnectDB();
   }

}