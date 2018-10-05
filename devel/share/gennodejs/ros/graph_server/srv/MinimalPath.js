// Auto-generated. Do not edit!

// (in-package graph_server.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MinimalPathRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = '';
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MinimalPathRequest
    // Serialize message field [start]
    bufferOffset = _serializer.string(obj.start, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = _serializer.string(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MinimalPathRequest
    let len;
    let data = new MinimalPathRequest(null);
    // Deserialize message field [start]
    data.start = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.start.length;
    length += object.goal.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'graph_server/MinimalPathRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'db3d2f7e614f0d3b76c6b211062636db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string start
    string goal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MinimalPathRequest(null);
    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = ''
    }

    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = ''
    }

    return resolved;
    }
};

class MinimalPathResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
      this.lange = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
      if (initObj.hasOwnProperty('lange')) {
        this.lange = initObj.lange
      }
      else {
        this.lange = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MinimalPathResponse
    // Serialize message field [path]
    bufferOffset = _arraySerializer.string(obj.path, buffer, bufferOffset, null);
    // Serialize message field [lange]
    bufferOffset = _serializer.uint64(obj.lange, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MinimalPathResponse
    let len;
    let data = new MinimalPathResponse(null);
    // Deserialize message field [path]
    data.path = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [lange]
    data.lange = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.path.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'graph_server/MinimalPathResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '59b4aba558407e942ec79c0eb37a79e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] path
    uint64 lange
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MinimalPathResponse(null);
    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = []
    }

    if (msg.lange !== undefined) {
      resolved.lange = msg.lange;
    }
    else {
      resolved.lange = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: MinimalPathRequest,
  Response: MinimalPathResponse,
  md5sum() { return '6321f4afb0321f086bd12ec44b09a3b8'; },
  datatype() { return 'graph_server/MinimalPath'; }
};
