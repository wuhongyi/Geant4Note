<!-- G4ParticleHPFissionData.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:38:30 2018 (+0800)
;; Last-Updated: 五 8月 10 07:39:20 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFissionData

**public G4VCrossSectionDataSet**

- Cross-section data set for a high precision (based on evaluated data libraries) description of neutron induced fission below 20 MeV; 
- To be used in your physics list in case you need this physics.
- In this case you want to register an object of this class with the corresponding process.

## class

```cpp
   public:
   
      G4ParticleHPFissionData();
   
      ~G4ParticleHPFissionData();

      G4bool IsIsoApplicable( const G4DynamicParticle* , 
                              G4int /*Z*/ , G4int /*A*/ ,
                              const G4Element* /*elm*/ ,
                              const G4Material* /*mat*/ );

      G4double GetIsoCrossSection( const G4DynamicParticle*  , 
                                   G4int /*Z*/ , G4int /*A*/ ,
                                   const G4Isotope* /*iso*/  ,
                                   const G4Element* /*elm*/  ,
                                   const G4Material* /*mat*/ );
   
      //G4bool IsApplicable(const G4DynamicParticle*, const G4Element*);

   public:
      //G4bool IsZAApplicable( const G4DynamicParticle* , G4double /*ZZ*/, G4double /*AA*/)
      //{ return false;}

      G4double GetCrossSection(const G4DynamicParticle*, const G4Element*, G4double aT);

      void BuildPhysicsTable(const G4ParticleDefinition&);

      void DumpPhysicsTable(const G4ParticleDefinition&);
   
   public:
      G4int GetVerboseLevel() const;
      void SetVerboseLevel( G4int );
      virtual void CrossSectionDescription(std::ostream&) const;

   private:
   
      G4PhysicsTable * theCrossSections;

      G4bool onFlightDB;
      G4bool instanceOfWorker;

      G4double ke_cache;
      G4double xs_cache;
      const G4Element* element_cache;
      const G4Material* material_cache;
```

<!-- G4ParticleHPFissionData.md ends here -->
