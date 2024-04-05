package package_173
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.class_17;
   import alternativa.osgi.service.logging.name_11;
   
   public class name_1828 implements name_11
   {
       
      
      private var logTarget:class_17;
      
      private var object:Object;
      
      public function name_1828(param1:Object, param2:class_17)
      {
         super();
         this.object = param1;
         this.logTarget = param2;
      }
      
      public function trace(param1:String, param2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.TRACE,param1,param2);
      }
      
      public function debug(param1:String, param2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.DEBUG,param1,param2);
      }
      
      public function info(param1:String, param2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.INFO,param1,param2);
      }
      
      public function warning(param1:String, param2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.WARNING,param1,param2);
      }
      
      public function error(param1:String, param2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.ERROR,param1,param2);
      }
   }
}
