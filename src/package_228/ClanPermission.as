package package_228
{
   public class ClanPermission
   {
      
      public static const SUPREME_COMMANDER:ClanPermission = new ClanPermission(0,"SUPREME_COMMANDER");
      
      public static const COMMANDER:ClanPermission = new ClanPermission(1,"COMMANDER");
      
      public static const OFFICER:ClanPermission = new ClanPermission(2,"OFFICER");
      
      public static const SERGEANT:ClanPermission = new ClanPermission(3,"SERGEANT");
      
      public static const VETERAN:ClanPermission = new ClanPermission(4,"VETERAN");
      
      public static const PRIVATE:ClanPermission = new ClanPermission(5,"PRIVATE");
      
      public static const NOVICE:ClanPermission = new ClanPermission(6,"NOVICE");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function ClanPermission(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<ClanPermission>
      {
         var _loc1_:Vector.<ClanPermission> = new Vector.<ClanPermission>();
         _loc1_.push(SUPREME_COMMANDER);
         _loc1_.push(COMMANDER);
         _loc1_.push(OFFICER);
         _loc1_.push(SERGEANT);
         _loc1_.push(VETERAN);
         _loc1_.push(PRIVATE);
         _loc1_.push(NOVICE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "ClanPermission [" + this.var_23 + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
   }
}
