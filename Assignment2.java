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
        String set_path = "SET search_path TO bnb;";
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
      String set_path = "SET search_path TO bnb;";
      String q1 = "CREATE VIEW test as SELECT * FROM Traveler;";
      String q2 = "SELECT * FROM test;";
      //PreparedStatement ps = connection.prepareStatement(queryString);
      
      Statement stt = connection.createStatement();
      stt.execute(set_path);
      stt.executeUpdate(q1);
      
      
      //PreparedStatement ps2 = connection.prepareStatement(queryString2);
      //ResultSet rs = ps.executeQuery();
      ResultSet rs = stt.executeQuery(q2);
      System.out.println(rs);

      while(rs.next()){
        String id = rs.getString("travelerid");
        travelers.add(id);

      }
      Statement st = connection.createStatement();
      st.execute(set_path);
      st.executeUpdate(q1);
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
        ArrayList<String> travelers = new ArrayList<String>();
        //hashmap of hashmaps
        HashMap<Integer, ArrayList<HashMap<Integer, Float>>> map = new HashMap<Integer, ArrayList<HashMap<Integer, Float>>>();
        //whole query    
          
        String set_path = "SET search_path TO bnb; ";     
        String drop = "DROP VIEW IF EXISTS travelers,average, homeowners,rating cascade;";
        String q1 = "CREATE VIEW travelers AS "+
"SELECT Traveler.TravelerId, Booking.listingId " +
"FROM Traveler LEFT OUTER JOIN Booking ON Traveler.travelerID=Booking.travelerId "+
"GROUP BY Traveler.travelerID, Booking.listingID "+
"order by traveler.travelerID;";


String q2 = "CREATE VIEW average AS "+
"SELECT Travelers.TravelerId, travelers.listingId,avg(coalesce(TravelerRating.rating,0)) AS avg "+
"FROM Travelers LEFT OUTER JOIN TravelerRating ON TravelerRating.listingID=Travelers.listingId "+
"GROUP BY Travelers.travelerID,travelers.listingId "+
"order by travelers.travelerID; ";

String q3 ="CREATE VIEW homeowners AS "+
"SELECT homeowner.homeownerid,listing.listingid FROM homeowner LEFT OUTER JOIN listing ON listing.owner = homeowner.homeownerid "+
"GROUP BY homeowner.homeownerid,listing.listingid;";

String q4 ="CREATE VIEW rating AS "+
"SELECT homeowners.homeownerid,average.travelerid,coalesce(average.avg,0)::float as avg "+
"FROM homeowners LEFT OUTER JOIN average ON homeowners.listingid = average.listingid "+
"GROUP BY homeowners.homeownerid,average.travelerid,average.avg; ";

String q5 = "SELECT * FROM rating; ";
 
      Statement st = connection.createStatement();
      st.execute(set_path);
      st.executeUpdate(drop);
      st.executeUpdate(q1);
      st.executeUpdate(q2);
      st.executeUpdate(q3);
      st.executeUpdate(q4);
      
 
      ResultSet rs = st.executeQuery(q5);
      System.out.println(rs);
  

      while(rs.next()){   
        //grab values from query                             
        int homeowner = rs.getInt("homeownerid"); 
         System.out.println(homeowner);
         
        int id = rs.getInt("travelerid");

         
        float avg =rs.getFloat("avg");
         

       HashMap<Integer, Float> val = new HashMap<Integer, Float>();
        val.put(id,avg); 

        if(map.containsKey(homeowner)){
           ArrayList<HashMap<Integer, Float>> key = map.get(homeowner);
           key.add(val);
           map.put(homeowner,key);
      
        }else{
           ArrayList<HashMap<Integer, Float>> key = new ArrayList<HashMap<Integer, Float>>();
           key.add(val);
           map.put(homeowner,key);
           }

        //I am formatting the dictionary like so {'4001':{[1002,1.5],[1001,1.4]},
        //'4002':{[1002,1.5],[1001,1.4]}....etc} so that to calculate the dot product
        //,we can just iterate through the hashmap like so: scores.get(1002).value * val.get(1002).value +  
        //scores.get(1003).value * val.get(1004).value...etc to get the dot products 
        //where 'scores' is the score of the homeowner specified by this funtions parameter
        //Below is where I tried to iterae through the map but for some reason
        //execute query isn't working.                         

      }
      
      Object scores = map.get(homeownerID); //get the scores for the homeowner specified
      map.remove(homeownerID); //remove that homeowner from hashmap

      Iterator it = map.entrySet().iterator();
      while (it.hasNext()) {

        Map.Entry pair = (Map.Entry)it.next();
        }

       System.out.println(map);
       //System.out.println(travelers);
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
      
      //a2.selectTravelerId();

     a2.homeownerRecommendation(4000);
      
      

      a2.disconnectDB();
   }

}
