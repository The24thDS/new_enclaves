const versionRegExp = /NE_VERSION: "(?<name>.*) v(?<version>.*)"/;

module.exports.readVersion = (contents) => {
  return contents.match(versionRegExp).groups.version;
};

module.exports.writeVersion = (contents, version) => {
  const name = contents.match(versionRegExp).groups.name;
  return contents.replace(versionRegExp, `NE_VERSION: "${name} v${version}"`);
};
