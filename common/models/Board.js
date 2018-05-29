'use strict';

module.exports = function (Board) {
  /**
   * Validate the presence of mentioned properties while calling the APIs.
   */
  Board.validatesPresenceOf(
    'boardName'
  );
};
