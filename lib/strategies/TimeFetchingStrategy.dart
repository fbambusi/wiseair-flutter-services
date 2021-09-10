abstract class TimeFetchingStrategy{
   DateTime nowLocal(){
     throw UnimplementedError();
    }

   DateTime hoursAgoLocal(int hoursAgo)
   {
     return this.nowLocal().subtract(Duration(hours: hoursAgo));
   }
}