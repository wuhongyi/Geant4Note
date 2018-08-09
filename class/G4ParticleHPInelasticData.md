<!-- G4ParticleHPInelasticData.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:26:24 2018 (+0800)
;; Last-Updated: 五 8月 10 07:27:21 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPInelasticData

**public G4VCrossSectionDataSet**

- Cross-section data set for a high precision (based on evaluated data libraries) description of neutron inelastic scattering below 20 MeV; 
- To be used in your physics list in case you need this physics.
- In this case you want to register an object of this class with the corresponding process.

## class

```cpp
   public:
   
      G4ParticleHPInelasticData(G4ParticleDefinition* projectile = G4Neutron::Neutron());
   
      ~G4ParticleHPInelasticData();

      G4bool IsIsoApplicable( const G4DynamicParticle* , 
                              G4int /*Z*/ , G4int /*A*/ ,
                              const G4Element* /*elm*/ ,
                              const G4Material* /*mat*/ );

      G4double GetIsoCrossSection( const G4DynamicParticle*  , 
                                   G4int /*Z*/ , G4int /*A*/ ,
                                   const G4Isotope* /*iso*/  ,
                                   const G4Element* /*elm*/  ,
                                   const G4Material* /*mat*/ );
   
       //G4bool IsApplicable(const G4DynamicParticle*, const G4Element*); ??

   public:
      //G4bool IsZAApplicable( const G4DynamicParticle* , G4double /*ZZ*/, G4double /*AA*/)
      //{ return false;} 

      G4double GetCrossSection(const G4DynamicParticle*, const G4Element*, G4double aT);

  //void BuildPhysicsTableHP(G4ParticleDefinition* projectile, const char* dataDirVariable); // name it 'HP' to avoid compilation warning because of G4VCrossSectionDataSet's method
      void BuildPhysicsTable( const G4ParticleDefinition& ); 

      void DumpPhysicsTable(const G4ParticleDefinition&);

      void IgnoreOnFlightDopplerBroadening(){ onFlightDB = false; };
      void EnableOnFlightDopplerBroadening(){ onFlightDB = true; };
   
  G4ParticleDefinition* GetProjectile(){return theProjectile;}
 
   public:
      G4int GetVerboseLevel() const;
      void SetVerboseLevel( G4int );
      virtual void CrossSectionDescription(std::ostream&) const;
 
   private:
   
      G4PhysicsTable * theCrossSections;

      G4bool onFlightDB;

  G4ParticleDefinition* theProjectile;

      G4ParticleHPData* theHPData;

      G4bool instanceOfWorker;

      G4double ke_cache;
      G4double xs_cache;
      const G4Element* element_cache;
      const G4Material* material_cache;
```

<!-- G4ParticleHPInelasticData.md ends here -->
