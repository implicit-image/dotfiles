{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "nwscriptd";
  version = "0.16";

  src = fetchPypi {
    inherit pname version;
    hash = "";  # Get this from PyPI
  };

  # Optional: add dependencies
  propagatedBuildInputs = [
    # other python packages
  ];

  # Optional: disable tests
  doCheck = false;

  meta = with lib; {
    description = "Description of the package";
    homepage = "https://pypi.org/project/${pname}/";
  };
}
