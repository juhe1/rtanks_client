package alternativa.physics
{
   import alternativa.physics.collision.name_1083;
   import alternativa.tanks.utils.name_1388;
   import alternativa.tanks.utils.name_1391;
   import package_37.Vector3;
   import package_403.ContactIsland;
   import package_403.IslandsGenerator;
   
   public class PhysicsScene
   {
      
      private static const const_1612:name_1391 = new name_1388(1000);
       
      
      public var var_1679:Number = 0.7;
      
      public var var_1685:Number = 10;
      
      public var var_1684:Number = 0.01;
      
      public var var_1682:int = 4;
      
      public var var_1681:int = 4;
      
      public var var_1683:int = 10;
      
      public var var_1686:Number = 5;
      
      public var var_1680:Number = 0.05;
      
      public const gravity:Vector3 = new Vector3(0,0,-9.8);
      
      public const const_1613:Number = gravity.vLength();
      
      public var name_247:name_1083;
      
      public var bodies:Vector.<Body>;
      
      public var var_1678:int;
      
      public var time:int;
      
      public var var_1676:Number;
      
      private const const_1611:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      private var var_1677:IslandsGenerator;
      
      public function PhysicsScene()
      {
         this.bodies = new Vector.<Body>();
         super();
         this.var_1677 = new IslandsGenerator(this);
      }
      
      public function name_1395(param1:Body) : void
      {
         param1.var_318 = this;
         param1.id = this.bodies.length;
         this.bodies.push(param1);
      }
      
      public function name_1392(param1:Body) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Body = null;
         var _loc4_:int = this.bodies.indexOf(param1);
         if(_loc4_ > -1)
         {
            _loc2_ = this.bodies.length - 1;
            _loc3_ = this.bodies[_loc2_];
            this.bodies[_loc4_] = _loc3_;
            _loc3_.id = _loc4_;
            this.bodies.length = _loc2_;
            param1.var_318 = null;
         }
      }
      
      public function update(param1:int) : void
      {
         ++this.var_1678;
         this.time += param1;
         this.var_1676 = param1 / const_1612.name_1390();
         this.method_1859(this.var_1676);
         this.method_1860();
         this.method_1854(this.const_1611,this.var_1676);
         this.var_1677.name_2175(this.const_1611,this.bodies.length);
         this.method_1855(this.var_1677.name_2171);
         this.method_1857(this.var_1676);
         this.method_1861(this.var_1677.name_2171);
         this.var_1677.clear();
         this.method_1862(this.const_1611);
         this.method_1864(this.var_1676);
         this.method_1858(this.var_1676);
      }
      
      private function method_1859(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:int = int(this.bodies.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.bodies[_loc4_];
            _loc2_.method_448();
            if(_loc2_.var_317 && !_loc2_.var_319)
            {
               _loc2_.var_301.x += this.gravity.x;
               _loc2_.var_301.y += this.gravity.y;
               _loc2_.var_301.z += this.gravity.z;
            }
            _loc4_++;
         }
      }
      
      private function method_1860() : void
      {
         this.method_1863();
         this.name_247.method_696(this.const_1611);
      }
      
      private function method_1863() : void
      {
         var _loc1_:Body = null;
         var _loc2_:int = int(this.bodies.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.bodies[_loc3_];
            if(!_loc1_.var_319)
            {
               _loc1_.method_440();
               _loc1_.method_438();
            }
            _loc3_++;
         }
      }
      
      private function method_1854(param1:Vector.<BodyContact>, param2:Number) : void
      {
         var _loc3_:BodyContact = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            this.method_1856(_loc3_.const_368,param2);
            _loc5_++;
         }
      }
      
      private function method_1856(param1:Vector.<ShapeContact>, param2:Number) : void
      {
         var _loc3_:ShapeContact = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc3_.name_2172();
            _loc3_.name_2173(this.var_1684,this.var_1679,this.var_1685,param2);
            _loc5_++;
         }
      }
      
      private function method_1855(param1:Vector.<ContactIsland>) : void
      {
         var _loc2_:ContactIsland = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.name_2176(this.var_1682);
            _loc4_++;
         }
      }
      
      private function method_1861(param1:Vector.<ContactIsland>) : void
      {
         var _loc2_:ContactIsland = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.name_2174(this.var_1681);
            _loc4_++;
         }
      }
      
      private function method_1857(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:int = int(this.bodies.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.bodies[_loc4_];
            _loc2_.method_431(param1);
            _loc4_++;
         }
      }
      
      private function method_1864(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:int = int(this.bodies.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.bodies[_loc4_];
            if(_loc2_.var_317 && !_loc2_.var_319)
            {
               _loc2_.method_436(param1);
               _loc2_.method_446(param1);
            }
            _loc4_++;
         }
      }
      
      private function method_1858(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:name_886 = null;
         var _loc4_:int = int(this.bodies.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.bodies[_loc5_];
            _loc2_.name_233();
            _loc2_.method_438();
            if(_loc2_.var_314 && !_loc2_.var_319)
            {
               _loc3_ = _loc2_.state;
               if(_loc3_.name_187.vLength() < this.var_1686 && _loc3_.name_181.vLength() < this.var_1680)
               {
                  ++_loc2_.var_313;
                  if(_loc2_.var_313 >= this.var_1683)
                  {
                     _loc2_.var_319 = true;
                  }
               }
               else
               {
                  _loc2_.var_313 = 0;
                  _loc2_.var_319 = false;
               }
            }
            _loc5_++;
         }
      }
      
      private function method_1862(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:BodyContact = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.dispose();
            _loc4_++;
         }
         param1.length = 0;
      }
   }
}
