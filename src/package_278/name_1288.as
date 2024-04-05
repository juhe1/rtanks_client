package package_278
{
   import package_404.CheatManager;
   
   public class name_1288
   {
       
      
      private var var_1690:SecureObject;
      
      private var fake:int;
      
      public function name_1288(param1:String = "Unnamed SecureInt", param2:int = 0)
      {
         super();
         this.fake = param2;
         this.var_1690 = new SecureObject(param1,param2);
      }
      
      public function set value(param1:int) : void
      {
         if(this.fake != this.var_1690.objectValue)
         {
            CheatManager.getInstance().name_2180(this.var_1690.name,this.fake,this.var_1690.objectValue);
         }
         this.var_1690.objectValue = param1;
         this.fake = param1;
      }
      
      public function get value() : int
      {
         return this.var_1690.objectValue as int;
      }
   }
}
