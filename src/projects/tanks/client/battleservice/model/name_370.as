package projects.tanks.client.battleservice.model
{
   public class name_370
   {
      
      public static var CTF:name_370 = new name_370();
      
      public static var TDM:name_370 = new name_370();
      
      public static var DM:name_370 = new name_370();
      
      public static var DOM:name_370 = new name_370();
       
      
      public function name_370()
      {
         super();
      }
      
      public static function getType(param1:String) : name_370
      {
         if(param1 == "DM")
         {
            return DM;
         }
         if(param1 == "TDM")
         {
            return TDM;
         }
         if(param1 == "CTF")
         {
            return CTF;
         }
         if(param1 == "CP")
         {
            return DOM;
         }
         return null;
      }
   }
}
