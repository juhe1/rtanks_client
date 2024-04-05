package controls.rangicons
{
   import flash.display.MovieClip;
   
   public class RangIcon extends MovieClip
   {
      
      private static const const_2243:Array = ["Recruit","Private","Gefreiter","Corporal","Master Corporal","Sergeant","Staff Sergeant","Master Sergeant","First Sergeant","Sergeant-Major","Warrant Officer 1","Warrant Officer 2","Warrant Officer 3","Warrant Officer 4","Warrant Officer 5","Third Lieutenant","Second Lieutenant","First Lieutenant","Captain","Major","Lieutenant Colonel","Colonel","Brigadier","Major General","Lieutenant General","General","Marshal"];
       
      
      private var var_277:int = 1;
      
      public function RangIcon(param1:int = 1)
      {
         super();
         this.rang = param1;
      }
      
      public static function method_2715(param1:int) : String
      {
         return const_2243[param1 - 1];
      }
      
      public function set rang(param1:int) : void
      {
         this.var_277 = param1;
         gotoAndStop(this.var_277);
      }
      
      public function get rang() : int
      {
         return this.var_277;
      }
   }
}
