<!-- G4ParticleHPSCFissionFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 11:08:05 2018 (+0800)
;; Last-Updated: 日 9月  2 11:10:45 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPSCFissionFS

**public G4ParticleHPFissionBaseFS**

读取高精度参数

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* projectile );
  G4DynamicParticleVector * ApplyYourself(G4int NNeutrons);
```

- "/SC/"
- G4ParticleHPFissionBaseFS



## class

```cpp
  public:
  
  G4ParticleHPSCFissionFS(){ hasXsec = false; }
  ~G4ParticleHPSCFissionFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* projectile );
  G4DynamicParticleVector * ApplyYourself(G4int NNeutrons);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPSCFissionFS * theNew = new G4ParticleHPSCFissionFS;
   return theNew;
  }
  
  private:
  G4HadFinalState * ApplyYourself(const G4HadProjectile &) { return 0; }
```

<!-- G4ParticleHPSCFissionFS.md ends here -->
