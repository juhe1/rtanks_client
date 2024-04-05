package package_403
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.QuickUnionFind;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class IslandsGenerator
   {
       
      
      public const name_2171:Vector.<ContactIsland> = new Vector.<ContactIsland>();
      
      private const const_2211:Dictionary = new Dictionary();
      
      private const const_2210:QuickUnionFind = new QuickUnionFind();
      
      private var name_678:PhysicsScene;
      
      public function IslandsGenerator(param1:PhysicsScene)
      {
         super();
         this.name_678 = param1;
      }
      
      public function name_2175(param1:Vector.<BodyContact>, param2:int) : void
      {
         this.method_2657(param1,param2);
         this.method_2656(param1);
      }
      
      private function method_2657(param1:Vector.<BodyContact>, param2:int) : void
      {
         var _loc3_:BodyContact = null;
         this.const_2210.init(param2);
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.body1.var_317 && _loc3_.body2.var_317)
            {
               this.const_2210.name_2866(_loc3_.body1.id,_loc3_.body2.id);
            }
            _loc5_++;
         }
      }
      
      private function method_2656(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:BodyContact = null;
         var _loc3_:int = 0;
         var _loc4_:ContactIsland = null;
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = param1[_loc6_];
            if(_loc2_.body1.var_317)
            {
               _loc3_ = this.const_2210.root(_loc2_.body1.id);
            }
            else
            {
               _loc3_ = this.const_2210.root(_loc2_.body2.id);
            }
            _loc4_ = this.const_2211[_loc3_];
            if(_loc4_ == null)
            {
               _loc4_ = ContactIsland.create();
               this.name_2171[this.name_2171.length] = _loc4_;
               this.const_2211[_loc3_] = _loc4_;
            }
            _loc4_.const_1611[_loc4_.const_1611.length] = _loc2_;
            _loc6_++;
         }
         var _loc7_:int = int(this.name_2171.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_ = this.name_2171[_loc8_];
            _loc4_.init(this.name_678);
            _loc8_++;
         }
         clearDictionary(this.const_2211);
      }
      
      public function clear() : void
      {
         var _loc1_:ContactIsland = null;
         var _loc2_:int = int(this.name_2171.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.name_2171[_loc3_];
            _loc1_.dispose();
            _loc3_++;
         }
         this.name_2171.length = 0;
      }
   }
}
