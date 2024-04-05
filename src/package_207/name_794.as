package package_207
{
   import flash.events.EventDispatcher;
   import platform.clients.fp10.libraries.alternativapartners.service.name_493;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_2142;
   
   public class name_794 extends EventDispatcher implements name_561
   {
      
      public static var partnerService:name_493;
       
      
      private var var_913:String;
      
      private var var_385:String;
      
      private var var_275:int;
      
      private var var_1550:int;
      
      private var var_1552:String;
      
      private var var_958:int;
      
      private var var_1551:String;
      
      private var var_951:String;
      
      public function name_794()
      {
         super();
      }
      
      public function get userId() : String
      {
         return this.var_913;
      }
      
      public function get userName() : String
      {
         return this.var_385;
      }
      
      public function get rank() : int
      {
         return this.var_1550;
      }
      
      public function get score() : int
      {
         return this.var_275;
      }
      
      public function method_1431(param1:String) : String
      {
         return this.var_1552 + name_2142.name_2143(param1) + (!!partnerService.method_1192() ? "?partners=1" : "");
      }
      
      public function get serverNumber() : int
      {
         return this.var_958;
      }
      
      public function get templateBattlePage() : String
      {
         return this.var_1551;
      }
      
      public function get gameHost() : String
      {
         return this.var_951;
      }
      
      public function name_1040(param1:int) : void
      {
         this.var_1550 = param1;
         dispatchEvent(new UserPropertiesServiceEvent(UserPropertiesServiceEvent.UPDATE_RANK,new name_2141(this.var_913,this.var_385,this.var_275,this.var_1550)));
      }
      
      public function updateScore(param1:int) : void
      {
         this.var_275 = param1;
         dispatchEvent(new UserPropertiesServiceEvent(UserPropertiesServiceEvent.UPDATE_SCORE,new name_2141(this.var_913,this.var_385,this.var_275,this.var_1550)));
      }
      
      public function init(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:String, param8:String) : void
      {
         this.var_913 = param1;
         this.var_385 = param2;
         this.var_275 = param3;
         this.var_1550 = param4;
         this.var_958 = param5;
         this.var_1551 = param6;
         this.var_951 = param7;
         this.var_1552 = param8;
      }
      
      public function method_1104() : Boolean
      {
         return this.var_1550 >= 4;
      }
   }
}
