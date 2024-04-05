package package_409
{
   import package_1.Main;
   import package_54.name_102;
   
   public class name_2229
   {
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
       
      
      public var color:uint;
      
      private var var_2867:String;
      
      public function name_2229(param1:uint, param2:String)
      {
         super();
         this.color = param1;
         this.var_2867 = param2;
      }
      
      public function getMessage(param1:String) : String
      {
         return localeService.getText(this.var_2867).replace("{point}",param1);
      }
   }
}
