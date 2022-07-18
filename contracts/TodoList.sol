// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract Todolist {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    mapping(uint256 => Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    constructor() public {
        createTask("tuntaskan materi blockchain");
    }

    // broadcast if there is new data
    event TaskCreated(uint256 id, string content, bool completed);

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }

    event TaskCompleted(uint id, bool completed);
}
