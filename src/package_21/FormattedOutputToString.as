package package_21
{
   import alternativa.osgi.service.command.class_16;
   
   public class FormattedOutputToString implements class_16
   {
       
      
      public var content:Vector.<String>;
      
      public function FormattedOutputToString()
      {
         this.content = new Vector.<String>();
         super();
      }
      
      public function method_209(param1:String) : void
      {
         this.content.push(param1);
      }
      
      public function method_207(param1:String, param2:String) : void
      {
         this.method_209(param1 + " " + param2);
      }
      
      public function method_208(param1:Vector.<String>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.method_209(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function method_210(param1:String, param2:Vector.<String>) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.method_207(param1,param2[_loc3_]);
            _loc3_++;
         }
      }
   }
}
