<!-- G4ParticleHPFission.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:36:10 2018 (+0800)
;; Last-Updated: 五 8月 10 07:37:29 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFission

**public G4HadronicInteraction**

- Final state production model for a high precision (based on evaluated data libraries) description of neutron induced fission below 20 MeV; 
- Note that this model (by intent of avoiding the possibility of heating studies) does not provide the nuclear fragments.

- To be used in your physics list in case you need this physics.
- In this case you want to register an object of this class with the corresponding process.

## class

```cpp
  public: 
  
  G4ParticleHPFission();

  ~G4ParticleHPFission();
  
  G4HadFinalState * ApplyYourself(const G4HadProjectile& aTrack, G4Nucleus& aTargetNucleus);

  virtual const std::pair<G4double, G4double> GetFatalEnergyCheckLevels() const;

   public:
      G4int GetVerboseLevel() const;
      void SetVerboseLevel( G4int );
      void BuildPhysicsTable(const G4ParticleDefinition&);
      virtual void ModelDescription(std::ostream& outFile) const;

  private:
  
  //G4ParticleHPChannel * theFission;
      std::vector<G4ParticleHPChannel*>* theFission;
  G4String dirName;
  G4int numEle;
```

<!-- G4ParticleHPFission.md ends here -->
