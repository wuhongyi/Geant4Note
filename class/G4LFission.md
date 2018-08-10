<!-- G4LFission.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:34:26 2018 (+0800)
;; Last-Updated: 五 8月 10 07:35:15 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4LFission

**public G4HadronicInteraction**

- Final state production model for induced fission; 
- To be used in your physics list in case you need this physics.
- In this case you want to register an object of this class with the corresponding process.

## class

```cpp
  public:

    G4LFission(const G4String& name = "G4LFission");
    ~G4LFission();
 
    G4HadFinalState* ApplyYourself(const G4HadProjectile& aTrack,
                                   G4Nucleus& targetNucleus);

    static G4double Atomas(const G4double A, const G4double Z);

    virtual void ModelDescription(std::ostream& outFile) const;

    virtual const std::pair<G4double, G4double> GetFatalEnergyCheckLevels() const;

  private:

    void init();
    G4double spneut[10];
```

<!-- G4LFission.md ends here -->
