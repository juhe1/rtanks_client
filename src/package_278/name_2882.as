package package_278
{
   import package_404.CheatManager;
   
   public class name_2882
   {
       
      
      private var var_1690:SecureObject;
      
      private var fake:Boolean;
      
      public function name_2882(param1:String = "Unnamed SecureBoolean")
      {
         super();
         this.var_1690 = new SecureObject();
      }
      
      public function set value(param1:Boolean) : void
      {
         if(this.fake != this.var_1690.objectValue)
         {
            CheatManager.getInstance().name_2180(this.var_1690.name,this.fake,this.var_1690.objectValue);
         }
         this.var_1690.objectValue = param1;
         this.fake = param1;
      }
      
      public function get value() : Boolean
      {
         return this.var_1690.objectValue as Boolean;
      }
   }
}
