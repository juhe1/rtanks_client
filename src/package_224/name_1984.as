package package_224
{
   import platform.client.fp10.core.type.name_70;
   
   public class name_1984
   {
       
      
      private var var_2667:Boolean;
      
      private var var_257:name_70;
      
      public function name_1984(param1:Boolean = false, param2:name_70 = null)
      {
         super();
         this.var_2667 = param1;
         this.var_257 = param2;
      }
      
      public function get clanLicense() : Boolean
      {
         return this.var_2667;
      }
      
      public function set clanLicense(param1:Boolean) : void
      {
         this.var_2667 = param1;
      }
      
      public function get licenseGarageObject() : name_70
      {
         return this.var_257;
      }
      
      public function set licenseGarageObject(param1:name_70) : void
      {
         this.var_257 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LicenseClanUserCC [";
         _loc1_ += "clanLicense = " + this.clanLicense + " ";
         _loc1_ += "licenseGarageObject = " + this.licenseGarageObject + " ";
         return _loc1_ + "]";
      }
   }
}
