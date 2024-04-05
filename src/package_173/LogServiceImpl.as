package package_173
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.class_17;
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   
   public class LogServiceImpl implements name_26, class_17
   {
       
      
      private var var_1105:Vector.<class_17>;
      
      public function LogServiceImpl()
      {
         this.var_1105 = new Vector.<class_17>();
         super();
      }
      
      public function getLogger(param1:Object) : name_11
      {
         return new name_1828(param1,this);
      }
      
      public function name_47(param1:class_17) : void
      {
         if(this.var_1105.indexOf(param1) < 0)
         {
            this.var_1105.push(param1);
         }
      }
      
      public function method_332(param1:class_17) : void
      {
         var _loc2_:int = this.var_1105.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.var_1105 = this.var_1105.splice(_loc2_,1);
         }
      }
      
      public function log(param1:Object, param2:LogLevel, param3:String, param4:Array = null) : void
      {
         var object:Object = param1;
         var level:LogLevel = param2;
         var message:String = param3;
         var params:Array = param4;
         var logTarget:class_17 = null;
         for each(logTarget in this.var_1105)
         {
            try
            {
               logTarget.log(object,level,message,params);
            }
            catch(e:Error)
            {
               trace(e.getStackTrace());
            }
         }
      }
   }
}
