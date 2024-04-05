package package_26
{
   import flash.events.Event;
   import package_275.name_865;
   
   public class name_866 extends Event
   {
      
      public static const UPDATE:String = "CreateClanServiceEvent.UPDATE";
       
      
      public var description:String;
      
      public var flag:name_865;
      
      public var rankIndex:int;
      
      public var name_2010:Boolean;
      
      public function name_866(param1:String, param2:String, param3:int, param4:name_865, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         this.description = param2;
         this.flag = param4;
         this.rankIndex = param3;
         this.name_2010 = param5;
         super(param1,param6,param7);
      }
   }
}
