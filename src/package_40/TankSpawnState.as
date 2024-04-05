package package_40
{
   public class TankSpawnState
   {
      
      public static var NEWCOME:TankSpawnState = new TankSpawnState("NEWCOME");
      
      public static var ACTIVE:TankSpawnState = new TankSpawnState("ACTIVE");
      
      public static var SUICIDE:TankSpawnState = new TankSpawnState("SUICIDE");
       
      
      private var name:String;
      
      public function TankSpawnState(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public function toString() : String
      {
         return this.name;
      }
   }
}
