// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract EmployeeRegistration {
    //------------------------------------------
    struct Employee {
        uint256 id;
        string name;
        string department;
        string designation;
    }
    //------------------------------------------
    Employee[] private EmployeeList;
    //------------------------------------------
    function addEmployeer(
        uint256 _id,
        string memory _name,
        string memory _department,
        string memory _designation
    ) public {
        for (uint256 i = 0; i < EmployeeList.length; i++) {
            require(EmployeeList[i].id =! _id, "Employee Id Already Exist");
        }
        EmployeeList.push(Employee(_id, _name, _department, _designation));
    }
    //------------------------------------------
    function getEmpoyeer(
        uint256 _id
    ) public view returns (string memory, string memory, string memory) {
        for (uint256 i = 0; i < EmployeeList.length; i++) {
            if (EmployeeList[i].id == _id) {
                return (
                    EmployeeList[i].name,
                    EmployeeList[i].department,
                    EmployeeList[i].designation
                );
            }
        }
        return ("Not Found", "Not Found", "Not found");
    }
    //------------------------------------------
    function getEmpoyeerLength() public view returns (uint256) {
        return EmployeeList.length;
    }
}
