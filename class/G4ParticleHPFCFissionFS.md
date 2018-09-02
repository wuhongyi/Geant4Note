<!-- G4ParticleHPFCFissionFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:50:20 2018 (+0800)
;; Last-Updated: 日 9月  2 10:52:50 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFCFissionFS

**public G4ParticleHPFissionBaseFS**

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* projectile);
  G4DynamicParticleVector * ApplyYourself(G4int nNeutrons);  
```

- "/FS/"
- G4ParticleHPFissionBaseFS


## class

```cpp
  public:
  
  G4ParticleHPFCFissionFS(){ hasXsec = false; }
  ~G4ParticleHPFCFissionFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* projectile);
  G4DynamicParticleVector * ApplyYourself(G4int nNeutrons);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPFCFissionFS * theNew = new G4ParticleHPFCFissionFS;
   return theNew;
  }
  
  private:
  G4HadFinalState * ApplyYourself(const G4HadProjectile & ) { return 0; }
```

<!-- G4ParticleHPFCFissionFS.md ends here -->
