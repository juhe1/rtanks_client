package package_21
{
   import alternativa.osgi.service.command.class_16;
   
   public class Command
   {
       
      
      public var cmd:String;
      
      public var var_1623:Function;
      
      public var argsType:Array;
      
      public var name_831:String;
      
      private var var_1622:String;
      
      public function Command(param1:String, param2:String, param3:String, param4:Array, param5:Function)
      {
         super();
         this.var_1622 = param3;
         this.name_831 = param1;
         this.argsType = param4;
         this.var_1623 = param5;
         this.cmd = param2;
      }
      
      public function name_834(param1:Array, param2:class_16) : void
      {
         var _loc3_:Array = new Array();
         _loc3_[0] = param2;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_ + 1] = param1[_loc4_];
            _loc4_++;
         }
         this.var_1623.apply(null,_loc3_);
      }
      
      public function help() : String
      {
         return this.argsType + " " + this.var_1622;
      }
   }
}
