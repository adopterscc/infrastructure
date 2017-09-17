pragma solidity ^0.4.13;

import "./Ownable.sol";

contract AdoptersProfile is Ownable {
  event onProfileCreatedOrUpdated(address adopter);

  struct Profile {
    string fullName;
    uint dateOfBirth;
    string photoIPFSId;
    string github;
    string twitter;
    string linkedIn;
    string slackId;
    uint[] languages;
  }
  mapping( address => Profile ) profiles;

  function createOrUpdateProfile(string fullName, uint dateOfBirth, string photoIPFSId, string github, string twitter, string linkedIn, string slackId, unit[] languages) {
    // fullName is mandatory field for Adopters
    if(bytes(fullName).length == 0) throw;
    // check if a profile already exists
    if( bytes(profiles[msg.sender].fullName).length > 0 ) {
      profile = profiles[msg.sender];
    } else {
      Profile memory profile;
    }
    profile.fullName = fullName;
    profile.dateOfBirth = dateOfBirth;
    profile.photoIPFSId = photoIPFSId;
    profile.github = github;
    profile.twitter = twitter;
    profile.linkedIn = linkedIn;
    profile.slackId = slackId;
    profile.languages = languages;
    profiles[msg.sender] = profile;
    onProfileCreatedOrUpdated(msg.sender);
  }

  function getProfile(address adopterAddress) constant returns(string,uint,string,string,string,string,string,uint[]) {
    return(profiles[adopterAddress].fullName, profiles[adopterAddress].dateOfBirth, profiles[adopterAddress].photoIPFSId, profiles[adopterAddress].github, profiles[adopterAddress].twitter, profiles[adopterAddress].linkedIn, profiles[adopterAddress].slackId, profiles[adopterAddress].languages);
  }

}
