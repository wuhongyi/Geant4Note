<!-- G4StatMF.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:30:30 2018 (+0800)
;; Last-Updated: 六 9月  1 13:31:52 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4StatMF

**public G4VMultiFragmentation**

Hadronic Process: Nuclear De-excitations

## class

```cpp
public:
    // Default constructor
    G4StatMF();
    // Destructor
    ~G4StatMF();

private:
    // Copy constructor	
    G4StatMF(const G4StatMF & right);

    // Operators
    G4StatMF & operator=(const G4StatMF & right);
    G4bool operator==(const G4StatMF & right);
    G4bool operator!=(const G4StatMF & right);

public:

    G4FragmentVector * BreakItUp(const G4Fragment &theNucleus);

private:

    // This finds temperature of breaking channel.
    G4bool FindTemperatureOfBreakingChannel(const G4Fragment & theFragment, 
					    const G4StatMFChannel * aChannel,
					    G4double & Temperature);

    // 
    G4double CalcEnergy(G4int A, G4int Z, 
			const G4StatMFChannel * aChannel,
			G4double T);


private:

    G4VStatMFEnsemble * _theEnsemble;
```

<!-- G4StatMF.md ends here -->
