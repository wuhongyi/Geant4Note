<!-- G4ParticleHPCapture.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:59:39 2018 (+0800)
;; Last-Updated: 五 8月 10 08:00:31 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPCapture

**public G4HadronicInteraction**

- Final state production model for a high precision (based on evaluated data libraries) description of neutron capture below 20 MeV; 
- To be used in your physics list in case you need this physics.
- In this case you want to register an object of this class with the corresponding process.

## class

```cpp
  public: 
  
  G4ParticleHPCapture();

  ~G4ParticleHPCapture();

  G4HadFinalState * ApplyYourself(const G4HadProjectile& aTrack, G4Nucleus& aTargetNucleus);

  virtual const std::pair<G4double, G4double> GetFatalEnergyCheckLevels() const;

   public:
      G4int GetVerboseLevel() const;
      void SetVerboseLevel( G4int );
      void BuildPhysicsTable(const G4ParticleDefinition&);
      virtual void ModelDescription(std::ostream& outFile) const;
  
  private:
  
      std::vector<G4ParticleHPChannel*>* theCapture;
  G4String dirName;
  G4int numEle;
  
  G4HadFinalState theResult;
```

<!-- G4ParticleHPCapture.md ends here -->
