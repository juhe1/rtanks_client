package alternativa.osgi.service.console
{
   import alternativa.osgi.service.logging.LogLevel;
   
   public class name_858
   {
       
      
      public var level:LogLevel;
      
      public var message:String;
      
      public var params:Array;
      
      public var object:Object;
      
      public var name_859:int;
      
      public function name_858(param1:int, param2:Object, param3:LogLevel, param4:String, param5:Array)
      {
         super();
         this.name_859 = param1;
         this.object = param2;
         this.params = param5;
         this.message = param4;
         this.level = param3;
      }
   }
}
