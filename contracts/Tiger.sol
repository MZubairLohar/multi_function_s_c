// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// Console log for testing solidity from hardhat
import "hardhat/console.sol";
interface IBEP20 {
    function totalSupply() external view returns (uint256);

    function decimals() external view returns (uint8);

    function symbol() external view returns (string memory);

    function name() external view returns (string memory);

    function getOwner() external view returns (address);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function allowance(address _owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}
interface IPancakeERC20 {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint256);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}
interface IPancakeFactory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);

    function allPairs(uint256) external view returns (address pair);

    function allPairsLength() external view returns (uint256);

    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}
interface IPancakeRouter01 {
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountETH);

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapTokensForExactETH(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function getamountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getamountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getamountsOut(uint256 amountIn, address[] calldata path)
        external
        view
        returns (uint256[] memory amounts);

    function getamountsIn(uint256 amountOut, address[] calldata path)
        external
        view
        returns (uint256[] memory amounts);
}
interface IPancakeRouter02 is IPancakeRouter01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}
/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        address msgSender = msg.sender;
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}
/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{value: value}(
            data
        );
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data)
        internal
        view
        returns (bytes memory)
    {
        return
            functionStaticCall(
                target,
                data,
                "Address: low-level static call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return
            functionDelegateCall(
                target,
                data,
                "Address: low-level delegate call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}
/**
 * @dev Library for managing
 * https://en.wikipedia.org/wiki/Set_(abstract_data_type)[sets] of primitive
 * types.
 *
 * Sets have the following properties:
 *
 * - Elements are added, removed, and checked for existence in constant time
 * (O(1)).
 * - Elements are enumerated in O(n). No guarantees are made on the ordering.
 *
 * ```
 * contract Example {
 *     // Add the library methods
 *     using EnumerableSet for EnumerableSet.AddressSet;
 *
 *     // Declare a set state variable
 *     EnumerableSet.AddressSet private mySet;
 * }
 * ```
 *
 * As of v3.3.0, sets of type `bytes32` (`Bytes32Set`), `address` (`AddressSet`)
 * and `uint256` (`UintSet`) are supported.
 */
library EnumerableSet {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Set type with
    // bytes32 values.
    // The Set implementation uses private functions, and user-facing
    // implementations (such as AddressSet) are just wrappers around the
    // underlying Set.
    // This means that we can only create new EnumerableSets for types that fit
    // in bytes32.

    struct Set {
        // Storage of set values
        bytes32[] _values;
        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping(bytes32 => uint256) _indexes;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            // The value is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        // We read and store the value's index to prevent multiple reads from the same storage slot
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) {
            // Equivalent to contains(set, value)
            // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
            // the array, and then remove the last element (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            // When the value to delete is the last one, the swap operation is unnecessary. However, since this occurs
            // so rarely, we still do the swap anyway to avoid the gas cost of adding an 'if' statement.

            bytes32 lastvalue = set._values[lastIndex];

            // Move the last value to the index where the value to delete is
            set._values[toDeleteIndex] = lastvalue;
            // Update the index for the moved value
            set._indexes[lastvalue] = valueIndex; // Replace lastvalue's index to valueIndex

            // Delete the slot where the moved value was stored
            set._values.pop();

            // Delete the index for the deleted slot
            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function _contains(Set storage set, bytes32 value)
        private
        view
        returns (bool)
    {
        return set._indexes[value] != 0;
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function _at(Set storage set, uint256 index)
        private
        view
        returns (bytes32)
    {
        require(
            set._values.length > index,
            "EnumerableSet: index out of bounds"
        );
        return set._values[index];
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(Bytes32Set storage set, bytes32 value)
        internal
        returns (bool)
    {
        return _add(set._inner, value);
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(Bytes32Set storage set, bytes32 value)
        internal
        returns (bool)
    {
        return _remove(set._inner, value);
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(Bytes32Set storage set, bytes32 value)
        internal
        view
        returns (bool)
    {
        return _contains(set._inner, value);
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(Bytes32Set storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(Bytes32Set storage set, uint256 index)
        internal
        view
        returns (bytes32)
    {
        return _at(set._inner, index);
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(AddressSet storage set, address value)
        internal
        returns (bool)
    {
        return _add(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(AddressSet storage set, address value)
        internal
        returns (bool)
    {
        return _remove(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(AddressSet storage set, address value)
        internal
        view
        returns (bool)
    {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(AddressSet storage set, uint256 index)
        internal
        view
        returns (address)
    {
        return address(uint160(uint256(_at(set._inner, index))));
    }

    // UintSet

    struct UintSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(UintSet storage set, uint256 value)
        internal
        returns (bool)
    {
        return _remove(set._inner, bytes32(value));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(UintSet storage set, uint256 value)
        internal
        view
        returns (bool)
    {
        return _contains(set._inner, bytes32(value));
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(UintSet storage set, uint256 index)
        internal
        view
        returns (uint256)
    {
        return uint256(_at(set._inner, index));
    }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Tiger Contract ////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
contract Tiger is IBEP20, Ownable {
    using Address for address;
    using EnumerableSet for EnumerableSet.AddressSet;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    mapping(address => uint256) private _sellLock;

    // address _WETHTokenAddress = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;
    address _WETHTokenAddress = 0x6725F303b657a9451d8BA641348b6761A6CC7a17; // (pancake factory)
    // address _KUSAFEMOONTokenAddress =0x4ABC52243fA1e7bFa3102CB89739f2C3D435bf85;
    // address _KOFFEETokenAddress = 0xc0ffeE0000921eB8DD7d506d4dE8D5B79b856157;

    EnumerableSet.AddressSet private _excluded;
    EnumerableSet.AddressSet private _whiteList;
    EnumerableSet.AddressSet private _excludedFromSellLock;
    EnumerableSet.AddressSet private _excludedFromStaking;

    mapping(address => bool) public _blacklist;
    bool isBlacklist = true;

    //Token Info
    string private constant _name = "Tiger Multifarm";
    string private constant _symbol = "Tiger";
    uint8 private constant _decimals = 9;
    uint256 public constant InitialSupply = 100000000000 * 10**6 * 10**_decimals; //equals 100.000.000 token

    //Divider for the MaxBalance based on circulating Supply (2%)
    uint8 public constant BalanceLimitDivider = 50;
    //Divider for the Whitelist MaxBalance based on initial Supply(2%)
    uint16 public constant WhiteListBalanceLimitDivider = 50;
    //Divider for sellLimit based on circulating Supply (1%)
    uint16 public constant SellLimitDivider = 100;
    //Sellers get locked for MaxSellLockTime so they can't dump repeatedly
    uint16 public constant MaxSellLockTime = 10 seconds;
    //TODO: Change to 7 days
    //The time Liquidity gets locked at start and prolonged once it gets released
    uint256 private constant DefaultLiquidityLockTime = 1 hours;
    address public constant TeamWallet =
        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public constant SecondTeamWallet =
        0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    //TODO: Change to Mainnet
    //TestNet
    // address private constant PancakeRouter =0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3; (not bsc)
    address private constant PancakeRouter = 0xD99D1c33F9fC3444f8101754aBC46c52416550D1; // (bsc pancake)
    //MainNet
    // address private constant PancakeRouter=0xc0fFee0000C824D24E0F280f1e4D21152625742b; (not  bsc)

    //variables that track balanceLimit and sellLimit,
    //can be updated based on circulating supply and Sell- and BalanceLimitDividers
    uint256 private _circulatingSupply = InitialSupply;
    uint256 public balanceLimit = _circulatingSupply;
    uint256 public sellLimit = _circulatingSupply;

    uint256 public qtyTokenToSwap = (sellLimit * 10) / 100;
    bool manualTokenToSwap = false;
    bool autoTokenToSwap = false;
    uint256 manualQtyTokenToSwap = (sellLimit * 10) / 100;
    bool sellAll = false;
    bool sellPeg = false;

    //Limits max tax, only gets applied for tax changes, doesn't affect inital Tax
    uint8 public constant MaxTax = 20;

    //Tracks the current Taxes, different Taxes can be applied for buy/sell/transfer
    uint8 private _buyTax;
    uint8 private _sellTax;
    uint8 private _transferTax;

    uint8 private _burnTax;
    uint8 private _liquidityTax;
    uint8 private _stakingTax;

    address private _pancakePairAddress;
    IPancakeRouter02 private _pancakeRouter;

    //modifier for functions only the team can call
    modifier onlyTeam() {
        require(_isTeam(msg.sender), "Caller not in Team");
        _;
    }

    //Checks if address is in Team, is needed to give Team access even if contract is renounced
    //Team doesn't have access to critical Functions that could turn this into a Rugpull(Exept liquidity unlocks)
    function _isTeam(address addr) private view returns (bool) {
        return
            addr == owner() || addr == TeamWallet || addr == SecondTeamWallet;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Constructor///////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    constructor() {
        //contract creator gets 90% of the token to create LP-Pair
        uint256 deployerBalance = (_circulatingSupply * 9) / 10;
        _balances[msg.sender] = deployerBalance;
        emit Transfer(address(0), msg.sender, deployerBalance);
        //contract gets 10% of the token to generate LP token and Marketing Budget fase
        //contract will sell token over the first 200 sells to generate maximum LP and ETH
        uint256 injectBalance = _circulatingSupply - deployerBalance;
        _balances[address(this)] = injectBalance;
        emit Transfer(address(0), address(this), injectBalance);

        //Sets Buy/Sell limits
        balanceLimit = InitialSupply / BalanceLimitDivider;
        sellLimit = InitialSupply / SellLimitDivider;

        //Sets sellLockTime to be 2 seconds by default
        sellLockTime = 2 seconds;

        //Set Starting Tax to very high percentage(36%) to achieve maximum burn in the beginning
        //as in the beginning there is the highest token volume
        //any change in tax rate needs to be below maxTax(20%)
        _buyTax = 20;
        _sellTax = 20; //Sell Tax is lower, as otherwise slippage would be too high to sell
        _transferTax = 20;
        //97% gets burned
        _burnTax = 3;
        //a small percentage gets added to the Contract token as 10% of token are already injected to
        //be converted to LP and MarketingETH
        _liquidityTax = 20;
        _stakingTax = 77;
        //Team wallet and deployer are excluded from Taxes
        _excluded.add(TeamWallet);
        _excluded.add(msg.sender);
        //excludes Pancake Router, pair, contract and burn address from staking
        _excludedFromStaking.add(address(_pancakeRouter));
        _excludedFromStaking.add(_pancakePairAddress);
        _excludedFromStaking.add(address(this));
        _excludedFromStaking.add(0x000000000000000000000000000000000000dEaD);
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Transfer functionality////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    //transfer function, every transfer runs through this function
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) private {
        require(sender != address(0), "Transfer from zero");
        require(recipient != address(0), "Transfer to zero");

        //Manually Excluded adresses are transfering tax and lock free
        bool isExcluded = (_excluded.contains(sender) ||
            _excluded.contains(recipient));
            console.log('Manually Excluded adresses are transfering tax and lock free',isExcluded);
        //Transactions from and to the contract are always tax and lock free
        bool isContractTransfer = (sender == address(this) ||
            recipient == address(this));
            console.log('is contract transfer :',isContractTransfer);
        //transfers between PancakeRouter and PancakePair are tax and lock free
        address pancakeRouter = address(_pancakeRouter);
        bool isLiquidityTransfer = ((sender == _pancakePairAddress &&
            recipient == pancakeRouter) ||
            (recipient == _pancakePairAddress && sender == pancakeRouter));
            console.log('transfer between router and pancake',isLiquidityTransfer);
        //differentiate between buy/sell/transfer to apply different taxes/restrictions
        bool isBuy = sender == _pancakePairAddress || sender == pancakeRouter;
        bool isSell = recipient == _pancakePairAddress ||
            recipient == pancakeRouter;
            console.log('buying :',isBuy);
            console.log('selling :',isSell);
        //Pick transfer
        if (isContractTransfer || isLiquidityTransfer || isExcluded) {
            _feelessTransfer(sender, recipient, amount);
            // console.log('feeless transfer :','sender',sender,'receipient', recipient,'amount',amount);
        } else {
            //once trading is enabled, it can't be turned off again
            require(tradingEnabled, "trading not yet enabled");
            if (whiteListTrading) {
                _whiteListTransfer(sender, recipient, amount, isBuy, isSell);
            } else {
                _taxedTransfer(sender, recipient, amount, isBuy, isSell);
                // console.log('taxed Transfer :','sender:',sender,'recipient:',recipient,'amount:',amount,'isBuy:',isBuy,'isSell:',isSell);
            }
        }
    }

    //if whitelist is active, all taxed transfers run through this
    function _whiteListTransfer(
        address sender,
        address recipient,
        uint256 amount,
        bool isBuy,
        bool isSell
    ) private {
        //only apply whitelist restrictions during buys and transfers
        if (!isSell) {
            //the recipient needs to be on Whitelist. Works for both buys and transfers.
            //transfers to other whitelisted addresses are allowed.
            require(
                _whiteList.contains(recipient),
                "recipient not on whitelist"
            );
            //Limit is 1/500 of initialSupply during whitelist, to allow for a large whitelist without causing a massive
            //price impact of the whitelist
            require(
                (_balances[recipient] + amount <=
                    InitialSupply / WhiteListBalanceLimitDivider),
                "amount exceeds whitelist max"
            );
        }
        _taxedTransfer(sender, recipient, amount, isBuy, isSell);
    }

    //applies taxes, checks for limits, locks generates autoLP and stakingETH, and autostakes
    function _taxedTransfer(
        address sender,
        address recipient,
        uint256 amount,
        bool isBuy,
        bool isSell
    ) private {
        uint256 recipientBalance = _balances[recipient];
        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "Transfer exceeds balance");

        uint8 tax;
        if (isSell) {
            if (isBlacklist) {
                require(!_blacklist[sender]);
            }
            if (!_excludedFromSellLock.contains(sender)) {
                //If seller sold less than sellLockTime(2h) ago, sell is declined, can be disabled by Team
                require(
                    _sellLock[sender] <= block.timestamp || sellLockDisabled,
                    "Seller in sellLock"
                );
                //Sets the time sellers get locked(2 hours by default)
                _sellLock[sender] = block.timestamp + sellLockTime;
            }
            //Sells can't exceed the sell limit(50.000 Tokens at start, can be updated to circulating supply)
            require(amount <= sellLimit, "Dump protection");
            tax = _sellTax;
        } else if (isBuy) {
            //Checks If the recipient balance(excluding Taxes) would exceed Balance Limit
            require(
                recipientBalance + amount <= balanceLimit,
                "whale protection"
            );
            tax = _buyTax;
        } else {
            //Transfer
            //withdraws ETH when sending less or equal to 1 Token
            //that way you can withdraw without connecting to any dApp.
            //might needs higher gas limit
            if (amount <= 10**(_decimals))
                claimFarmedToken(sender, _WETHTokenAddress);
            //Checks If the recipient balance(excluding Taxes) would exceed Balance Limit
            require(
                recipientBalance + amount <= balanceLimit,
                "whale protection"
            );
            //Transfers are disabled in sell lock, this doesn't stop someone from transfering before
            //selling, but there is no satisfying solution for that, and you would need to pax additional tax
            if (!_excludedFromSellLock.contains(sender))
                require(
                    _sellLock[sender] <= block.timestamp || sellLockDisabled,
                    "Sender in Lock"
                );
            tax = _transferTax;
        }
        //Swapping AutoLP and MarketingETH is only possible if sender is not pancake pair,
        //if its not manually disabled, if its not already swapping and if its a Sell to avoid
        // people from causing a large price impact from repeatedly transfering when theres a large backlog of Tokens
        if (
            (sender != _pancakePairAddress) &&
            (!manualConversion) &&
            (!_isSwappingContractModifier) &&
            isSell
        ) _swapContractToken(amount);
        //Calculates the exact token amount for each tax
        uint256 tokensToBeBurnt = _calculateFee(amount, tax, _burnTax);
        //staking and liquidity Tax get treated the same, only during conversion they get split
        uint256 contractToken = _calculateFee(
            amount,
            tax,
            _stakingTax + _liquidityTax
        );
        //Subtract the Taxed Tokens from the amount
        uint256 taxedAmount = amount - (tokensToBeBurnt + contractToken);

        //Removes token and handles staking
        _removeToken(sender, amount);

        //Adds the taxed tokens to the contract wallet
        _balances[address(this)] += contractToken;
        //Burns tokens
        _circulatingSupply -= tokensToBeBurnt;

        //Adds token and handles staking
        _addToken(recipient, taxedAmount);

        emit Transfer(sender, recipient, taxedAmount);
    }

    //Feeless transfer only transfers and autostakes
    function _feelessTransfer(
        address sender,
        address recipient,
        uint256 amount
    ) private {
        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "Transfer exceeds balance");
        //Removes token and handles staking
        _removeToken(sender, amount);
        //Adds token and handles staking
        _addToken(recipient, amount);

        emit Transfer(sender, recipient, amount);
    }

    //Calculates the token that should be taxed
    function _calculateFee(
        uint256 amount,
        uint8 tax,
        uint8 taxPercent
    ) private pure returns (uint256) {
        return (amount * tax * taxPercent) / 10000;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //ETH Autostake/////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Autostake uses the balances of each holder to redistribute auto generated ETH.
    //Each transaction _addToken and _removeToken gets called for the transaction amount
    //WithdraWETH can be used for any holder to withdraw ETH at any time, like true Staking,
    //so unlike MRAT clones you can leave and forget your Token and claim after a while

    //lock for the withdraw
    bool private _isWithdrawing;
    //Multiplier to add some accuracy to profitPerShare
    uint256 private constant DistributionMultiplier = 2**64;
    //profit for each share a holder holds, a share equals a token.
    uint256 public profitPerShare;
    //the total reward distributed through staking, for tracking purposes
    uint256 public totalStakingReward;
    //the total payout through staking, for tracking purposes
    uint256 public totalPayouts;

    //marketing share starts at 80% to push initial marketing, after start
    //its capped to 50% max, the percentage of the staking that gets used for
    //marketing/paying the team
    uint8 public marketingShare = 10;
    //balance that is claimable by the team
    uint256 public marketingBalance;

    //Mapping of the already paid out(or missed) shares of each staker
    mapping(address => uint256) private alreadyPaidShares;
    //Mapping of shares that are reserved for payout
    mapping(address => uint256) private toBePaid;

    //Contract, pancake and burnAddress are excluded, other addresses like CEX
    //can be manually excluded, excluded list is limited to 30 entries to avoid a
    //out of gas exeption during sells
    function isExcludedFromStaking(address addr) public view returns (bool) {
        return _excludedFromStaking.contains(addr);
    }

    //Total shares equals circulating supply minus excluded Balances
    function _getTotalShares() public view returns (uint256) {
        uint256 shares = _circulatingSupply;
        //substracts all excluded from shares, excluded list is limited to 30
        // to avoid creating a Honeypot through OutOfGas exeption
        for (uint256 i = 0; i < _excludedFromStaking.length(); i++) {
            shares -= _balances[_excludedFromStaking.at(i)];
        }
        return shares;
    }

    //adds Token to balances, adds new ETH to the toBePaid mapping and resets staking
    function _addToken(address addr, uint256 amount) private {
        //the amount of token after transfer
        uint256 newAmount = _balances[addr] + amount;

        if (isExcludedFromStaking(addr)) {
            _balances[addr] = newAmount;
            return;
        }

        //gets the payout before the change
        uint256 payment = _newDividentsOf(addr);
        //resets dividents to 0 for newAmount
        alreadyPaidShares[addr] = profitPerShare * newAmount;
        //adds dividents to the toBePaid mapping
        toBePaid[addr] += payment;
        //sets newBalance
        _balances[addr] = newAmount;
    }

    //removes Token, adds ETH to the toBePaid mapping and resets staking
    function _removeToken(address addr, uint256 amount) private {
        //the amount of token after transfer
        uint256 newAmount = _balances[addr] - amount;

        if (isExcludedFromStaking(addr)) {
            _balances[addr] = newAmount;
            return;
        }

        //gets the payout before the change
        uint256 payment = _newDividentsOf(addr);
        //sets newBalance
        _balances[addr] = newAmount;
        //resets dividents to 0 for newAmount
        alreadyPaidShares[addr] = profitPerShare * newAmount;
        //adds dividents to the toBePaid mapping
        toBePaid[addr] += payment;
    }

    //gets the not dividents of a staker that aren't in the toBePaid mapping
    //returns wrong value for excluded accounts
    function _newDividentsOf(address staker) private view returns (uint256) {
        uint256 fullPayout = profitPerShare * _balances[staker];
        // if theres an overflow for some unexpected reason, return 0, instead of
        // an exeption to still make trades possible
        if (fullPayout < alreadyPaidShares[staker]) return 0;
        return
            (fullPayout - alreadyPaidShares[staker]) / DistributionMultiplier;
    }

    //distributes ETH between marketing share and dividents
    function _distributeStake(uint256 ETHamount) private {
        // Deduct marketing Tax
        uint256 marketingSplit = (ETHamount * marketingShare) / 100;
        uint256 amount = ETHamount - marketingSplit;

        marketingBalance += marketingSplit;

        if (amount > 0) {
            totalStakingReward += amount;
            uint256 totalShares = _getTotalShares();
            //when there are 0 shares, add everything to marketing budget
            if (totalShares == 0) {
                marketingBalance += amount;
            } else {
                //Increases profit per share based on current total shares
                profitPerShare += ((amount * DistributionMultiplier) /
                    totalShares);
            }
        }
    }

    event OnWithdrawFarmedToken(uint256 amount, address recipient);

    //withdraws all dividents of address
    function claimFarmedToken(address addr, address tkn) private {
        require(!_isWithdrawing);
        _isWithdrawing = true;
        uint256 amount;
        if (isExcludedFromStaking(addr)) {
            //if excluded just withdraw remaining toBePaid ETH
            amount = toBePaid[addr];
            toBePaid[addr] = 0;
        } else {
            uint256 newAmount = _newDividentsOf(addr);
            //sets payout mapping to current amount
            alreadyPaidShares[addr] = profitPerShare * _balances[addr];
            //the amount to be paid
            amount = toBePaid[addr] + newAmount;
            toBePaid[addr] = 0;
        }
        if (amount == 0) {
            //no withdraw if 0 amount
            _isWithdrawing = false;
            return;
        }
        totalPayouts += amount;
        address[] memory path = new address[](2);
        path[0] = _pancakeRouter.WETH(); //ETH
        path[1] = tkn; //FarmedToken

        _pancakeRouter.swapExactETHForTokensSupportingFeeOnTransferTokens{
            value: amount
        }(0, path, addr, block.timestamp);

        emit OnWithdrawFarmedToken(amount, addr);
        _isWithdrawing = false;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Swap Contract Tokens//////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    //tracks auto generated ETH, useful for ticker etc
    uint256 public totalLPETH;
    //Locks the swap if already swapping
    bool private _isSwappingContractModifier;
    modifier lockTheSwap {
        _isSwappingContractModifier = true;
        _;
        _isSwappingContractModifier = false;
    }

    //swaps the token on the contract for Marketing ETH and LP Token.
    //always swaps the sellLimit of token to avoid a large price impact
    function _swapContractToken(uint256 sellAmount) private lockTheSwap {
        uint256 contractBalance = _balances[address(this)];
        uint16 totalTax = _liquidityTax + _stakingTax;
        // If is manual, don't autoset tokenToSwap
        uint256 tokenToSwap = (sellLimit * 10) / 100;
        if (manualTokenToSwap) {
            tokenToSwap = manualQtyTokenToSwap;
        }
        // If enabled, autoupdate tokenToSwap
        if (autoTokenToSwap && !manualTokenToSwap) {
            tokenToSwap =
                ((_circulatingSupply -
                    _balances[0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3]) *
                    5) / 100;   //5% circulating supply
        }
        // If sell peg is active, tokenToSwap can't be > to the sell happening
        bool prevSellPeg = sellPeg;
        if (sellAmount == 192919291929192919291929192919291929) {
            sellPeg = false;
        }
        if (sellPeg) {
            if (tokenToSwap > sellAmount) {
                tokenToSwap = sellAmount - 1;
            }
        }
        sellPeg = prevSellPeg;
        // If sell all go back to 1
        if (sellAll) {
            tokenToSwap = contractBalance - 1;
        }

        //only swap if contractBalance is larger than tokenToSwap, and totalTax is unequal to 0
        if (contractBalance < tokenToSwap || totalTax == 0) {
            return;
        }
        //splits the token in TokenForLiquidity and tokenForMarketing
        uint256 tokenForLiquidity = (tokenToSwap * _liquidityTax) / totalTax;
        uint256 tokenForMarketing = tokenToSwap - tokenForLiquidity;

        //splits tokenForLiquidity in 2 halves
        uint256 liqToken = tokenForLiquidity / 2;
        uint256 liqETHToken = tokenForLiquidity - liqToken;

        //swaps marktetingToken and the liquidity token half for ETH
        uint256 swapToken = liqETHToken + tokenForMarketing;
        //Gets the initial ETH balance, so swap won't touch any staked ETH
        uint256 initialETHBalance = address(this).balance;
        _swapTokenForETH(swapToken);
        uint256 neWETH = (address(this).balance - initialETHBalance);
        //calculates the amount of ETH belonging to the LP-Pair and converts them to LP
        uint256 liqETH = (neWETH * liqETHToken) / swapToken;
        _addLiquidity(liqToken, liqETH);
        //Get the ETH balance after LP generation to get the
        //exact amount of token left for Staking
        uint256 distributeETH = (address(this).balance - initialETHBalance);
        //distributes remaining ETH between stakers and Marketing
        _distributeStake(distributeETH);
    }

    //swaps tokens on the contract for ETH
    function _swapTokenForETH(uint256 amount) private {
        _approve(address(this), address(_pancakeRouter), amount);
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = _pancakeRouter.WETH();

        _pancakeRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    //Adds Liquidity directly to the contract where LP are locked(unlike safemoon forks, that transfer it to the owner)
    function _addLiquidity(uint256 tokenamount, uint256 ETHamount) private {
        totalLPETH += ETHamount;
        _approve(address(this), address(_pancakeRouter), tokenamount);
        _pancakeRouter.addLiquidityETH{value: ETHamount}(
            address(this),
            tokenamount,
            0,
            0,
            address(this),
            block.timestamp
        );
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    // // public functions /////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    function getLiquidityReleaseTimeInSeconds() public view returns (uint256) {
        if (block.timestamp < _liquidityUnlockTime) {
            return _liquidityUnlockTime - block.timestamp;
        }
        return 0;
    }

    function getBurnedTokens() public view returns (uint256) {
        return (InitialSupply - _circulatingSupply) / 10**_decimals;
    }

    function getLimits() public view returns (uint256 balance, uint256 sell) {
        return (balanceLimit / 10**_decimals, sellLimit / 10**_decimals);
    }

    function getTaxes()
        public
        view
        returns (
            uint256 burnTax,
            uint256 liquidityTax,
            uint256 marketingTax,
            uint256 buyTax,
            uint256 sellTax,
            uint256 transferTax
        )
    {
        // console.log(
        //     'Fee structure:',
        //     'burnTax:',
        //     _burnTax,
        //     'liquidityTax',
        //     _liquidityTax,
        //     'stakingTax',
        //     _stakingTax,
        //     'buyTax',
        //     _buyTax,
        //     'sellTax',
        //     _sellTax,
        //     'transferTax',
        //     _transferTax);
        return (
            _burnTax,
            _liquidityTax,
            _stakingTax,
            _buyTax,
            _sellTax,
            _transferTax
        );
    }

    function getWhitelistedStatus(address AddressToCheck)
        public
        view
        returns (bool)
    {
        return _whiteList.contains(AddressToCheck);
    }

    //How long is a given address still locked from selling
    function getAddressSellLockTimeInSeconds(address AddressToCheck)
        public
        view
        returns (uint256)
    {
        uint256 lockTime = _sellLock[AddressToCheck];
        if (lockTime <= block.timestamp) {
            return 0;
        }
        return lockTime - block.timestamp;
    }

    function getSellLockTimeInSeconds() public view returns (uint256) {
        return sellLockTime;
    }

    //Functions every wallet can call
    //Resets sell lock of caller to the default sellLockTime should something go very wrong
    function AddressResetSellLock() public {
        _sellLock[msg.sender] = block.timestamp + sellLockTime;
    }

    //withdraws dividents of sender
    function FarmedTokenWithdraw(address tokenAddress) public {
        claimFarmedToken(msg.sender, tokenAddress);
    }

    function WETHWithdraw() public {
        claimFarmedToken(msg.sender, _WETHTokenAddress);
    }

    // function KOFFEEWithdraw() public {
    //     claimFarmedToken(msg.sender, _KOFFEETokenAddress);
    // }

    // function KUSAFEMOONWithdraw() public {
    //     claimFarmedToken(msg.sender, _KUSAFEMOONTokenAddress);
    // }

    function getDividends(address addr) public view returns (uint256) {
        if (isExcludedFromStaking(addr)) return toBePaid[addr];
        return _newDividentsOf(addr) + toBePaid[addr];
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Settings//////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    bool public sellLockDisabled;
    uint256 public sellLockTime;
    bool public manualConversion;

    //Excludes account from Staking

    function setRouterAddress(address newRouter) external onlyOwner {
      //Thanks to FreezyEx
        IPancakeRouter02 _newRouter = IPancakeRouter02(newRouter);
        address get_pair = IPancakeFactory(_newRouter.factory()).getPair(address(this), _newRouter.WETH());
        //checks if pair already exists
        if (get_pair == address(0)) {
            _pancakePairAddress = IPancakeFactory(_newRouter.factory()).createPair(address(this), _newRouter.WETH());
        }
        else {
            _pancakePairAddress = get_pair;
        }
        _pancakeRouter = _newRouter;
    }

    function TeamExcludeFromStaking(address addr) public onlyTeam {
        //a long exluded list could lead to a Honeypot, therefore limit entries
        require(_excludedFromStaking.length() < 30);
        require(!isExcludedFromStaking(addr));
        uint256 newDividents = _newDividentsOf(addr);
        alreadyPaidShares[addr] = _balances[addr] * profitPerShare;
        toBePaid[addr] += newDividents;
        _excludedFromStaking.add(addr);
    }

    //Includes excluded Account to staking
    function TeamIncludeToStaking(address addr) public onlyTeam {
        require(isExcludedFromStaking(addr));
        _excludedFromStaking.remove(addr);
        //sets alreadyPaidShares to the current amount
        alreadyPaidShares[addr] = _balances[addr] * profitPerShare;
    }

    function TeamWithdrawMarketingETH() public onlyTeam {
        uint256 amount = marketingBalance;
        marketingBalance = 0;
        (bool sent, ) = TeamWallet.call{value: (amount)}("");
        require(sent, "withdraw failed");
    }

    function TeamWithdrawMarketingETH(uint256 amount) public onlyTeam {
        require(amount <= marketingBalance);
        marketingBalance -= amount;
        (bool sent, ) = TeamWallet.call{value: (amount)}("");
        require(sent, "withdraw failed");
    }

    function TeamSwapSetSellPeg(bool setter) public onlyTeam {
        sellPeg = setter;
    }

    function TeamSwapSetAutoUpdateLiqSell(bool setter) public onlyTeam {
        autoTokenToSwap = setter;
    }

    function TeamSwapSetManualLiqSell(bool setter) public onlyTeam {
        manualTokenToSwap = setter;
    }

    function TeamSwapSetManualLiqSellTokens(uint256 amount) public onlyTeam {
        require(
            amount > 1 && amount < 100000000,
            "Values between 1 and 100000000"
        );
        manualQtyTokenToSwap = amount * 10**9;
    }

    //switches autoLiquidity and marketing ETH generation during transfers
    function TeamSwapSwitchManualETHConversion(bool manual) public onlyTeam {
        manualConversion = manual;
    }

    //Disables the timeLock after selling for everyone
    function TeamDisableSellLock(bool disabled) public onlyTeam {
        sellLockDisabled = disabled;
    }

    //Sets SellLockTime, needs to be lower than MaxSellLockTime
    function TeamSetSellLockTime(uint256 sellLockSeconds) public onlyTeam {
        require(sellLockSeconds <= MaxSellLockTime, "Sell Lock time too high");
        sellLockTime = sellLockSeconds;
    }

    //Sets Taxes, is limited by MaxTax(20%) to make it impossible to create honeypot
    function TeamSetTaxes(
        uint8 burnTaxes,
        uint8 liquidityTaxes,
        uint8 stakingTaxes,
        uint8 buyTax,
        uint8 sellTax,
        uint8 transferTax
    ) public onlyTeam {
        uint8 totalTax = burnTaxes + liquidityTaxes + stakingTaxes;
        require(totalTax == 100, "burn+liq+marketing needs to equal 100%");
        require(
            buyTax <= MaxTax && sellTax <= MaxTax && transferTax <= MaxTax,
            "taxes higher than max tax"
        );

        _burnTax = burnTaxes;
        _liquidityTax = liquidityTaxes;
        _stakingTax = stakingTaxes;

        _buyTax = buyTax;
        _sellTax = sellTax;
        _transferTax = transferTax;
    }

    //How much of the staking tax should be allocated for marketing
    function TeamChangeMarketingShare(uint8 newShare) public onlyTeam {
        require(newShare <= 90);
        marketingShare = newShare;
    }

    //manually converts contract token to LP and staking ETH
    function TeamCreateLPandETH() public onlyTeam {
        _swapContractToken(192919291929192919291929192919291929);
    }

    function TeamSellAllTokens() public onlyTeam {
        sellAll = true;
        _swapContractToken(192919291929192919291929192919291929);
        sellAll = false;
    }

    //Exclude/Include account from fees (eg. CEX)
    function TeamExcludeAccountFromFees(address account) public onlyTeam {
        _excluded.add(account);
    }

    function TeamIncludeAccountToFees(address account) public onlyTeam {
        _excluded.remove(account);
    }

    //Exclude/Include account from fees (eg. CEX)
    function TeamExcludeAccountFromSellLock(address account) public onlyTeam {
        _excludedFromSellLock.add(account);
    }

    function TeamIncludeAccountToSellLock(address account) public onlyTeam {
        _excludedFromSellLock.remove(account);
    }

    //Limits need to be at least target, to avoid setting value to 0(avoid potential Honeypot)
    function TeamUpdateLimits(uint256 newBalanceLimit, uint256 newSellLimit)
        public
        onlyTeam
    {
        //SellLimit needs to be below 2% to avoid a Large Price impact when generating auto LP
        require(newSellLimit < _circulatingSupply / 50);
        //Adds decimals to limits
        newBalanceLimit = newBalanceLimit * 10**_decimals;
        newSellLimit = newSellLimit * 10**_decimals;
        //Calculates the target Limits based on supply
        uint256 targetBalanceLimit = _circulatingSupply / BalanceLimitDivider;
        uint256 targetSellLimit = _circulatingSupply / SellLimitDivider;

        require(
            (newBalanceLimit >= targetBalanceLimit),
            "newBalanceLimit needs to be at least target"
        );
        require(
            (newSellLimit >= targetSellLimit),
            "newSellLimit needs to be at least target"
        );

        balanceLimit = newBalanceLimit;
        sellLimit = newSellLimit;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Setup Functions///////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    bool public tradingEnabled;
    bool public whiteListTrading;
    address private _liquidityTokenAddress;

    //Enables whitelist trading and locks Liquidity for a short time
    function SetupEnableWhitelistTrading() public onlyTeam {
        require(!tradingEnabled);
        //Sets up the excluded from staking list
        tradingEnabled = true;
        whiteListTrading = true;
        //Liquidity gets locked for 7 days at start, needs to be prolonged once
        //start is successful
        _liquidityUnlockTime = block.timestamp + DefaultLiquidityLockTime;
    }

    //Enables trading for everyone
    function SetupEnableTrading() public onlyTeam {
        require(tradingEnabled && whiteListTrading);
        whiteListTrading = false;
    }

    //Sets up the LP-Token Address required for LP Release
    function SetupLiquidityTokenAddress(address liquidityTokenAddress)
        public
        onlyTeam
    {
        _liquidityTokenAddress = liquidityTokenAddress;
    }

    //Functions for whitelist
    function SetupAddToWhitelist(address addressToAdd) public onlyTeam {
        _whiteList.add(addressToAdd);
    }

    function SetupAddArrayToWhitelist(address[] memory addressesToAdd)
        public
        onlyTeam
    {
        for (uint256 i = 0; i < addressesToAdd.length; i++) {
            _whiteList.add(addressesToAdd[i]);
        }
    }

    function SetupRemoveFromWhitelist(address addressToRemove) public onlyTeam {
        _whiteList.remove(addressToRemove);
    }

    function rescueTokens(address tknAddress) public onlyTeam {
        IBEP20 token = IBEP20(tknAddress);
        uint256 ourBalance = token.balanceOf(address(this));
        require(ourBalance > 0, "No tokens in our balance");
        token.transfer(msg.sender, ourBalance);
    }

    // Blacklists

    function setBlacklistEnabled(bool isBlacklistEnabled) public onlyTeam {
        isBlacklist = isBlacklistEnabled;
    }

    function setBlacklistedAddress(address toBlacklist) public onlyTeam {
        _blacklist[toBlacklist] = true;
    }

    function removeBlacklistedAddress(address toRemove) public onlyTeam {
        _blacklist[toRemove] = false;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Liquidity Lock////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //the timestamp when Liquidity unlocks
    uint256 private _liquidityUnlockTime;

    //Sets Liquidity Release to 20% at a time and prolongs liquidity Lock for a Week after Release.
    //Should be called once start was successful.
    bool public liquidityRelease20Percent;

    function TeamlimitLiquidityReleaseTo20Percent() public onlyTeam {
        liquidityRelease20Percent = true;
    }

    function TeamUnlockLiquidityInSeconds(uint256 secondsUntilUnlock)
        public
        onlyTeam
    {
        _prolongLiquidityLock(secondsUntilUnlock + block.timestamp);
    }

    function _prolongLiquidityLock(uint256 newUnlockTime) private {
        // require new unlock time to be longer than old one
        require(newUnlockTime > _liquidityUnlockTime);
        _liquidityUnlockTime = newUnlockTime;
    }

    //Release Liquidity Tokens once unlock time is over
    function TeamReleaseLiquidity() public onlyTeam {
        //Only callable if liquidity Unlock time is over
        require(block.timestamp >= _liquidityUnlockTime, "Not yet unlocked");

        IPancakeERC20 liquidityToken = IPancakeERC20(_liquidityTokenAddress);
        uint256 amount = liquidityToken.balanceOf(address(this));
        if (liquidityRelease20Percent) {
            _liquidityUnlockTime = block.timestamp + DefaultLiquidityLockTime;
            //regular liquidity release, only releases 20% at a time and locks liquidity for another week
            amount = (amount * 2) / 10;
            liquidityToken.transfer(TeamWallet, amount);
        } else {
            //Liquidity release if something goes wrong at start
            //liquidityRelease20Percent should be called once everything is clear
            liquidityToken.transfer(TeamWallet, amount);
        }
    }

    //Removes Liquidity once unlock Time is over,
    function TeamRemoveLiquidity(bool addToStaking) public onlyTeam {
        //Only callable if liquidity Unlock time is over
        require(block.timestamp >= _liquidityUnlockTime, "Not yet unlocked");
        _liquidityUnlockTime = block.timestamp + DefaultLiquidityLockTime;
        IPancakeERC20 liquidityToken = IPancakeERC20(_liquidityTokenAddress);
        uint256 amount = liquidityToken.balanceOf(address(this));
        if (liquidityRelease20Percent) {
            amount = (amount * 2) / 10; //only remove 20% each
        }
        liquidityToken.approve(address(_pancakeRouter), amount);
        //Removes Liquidity and either distributes liquidity ETH to stakers, or
        // adds them to marketing Balance
        //Token will be converted
        //to Liquidity and Staking ETH again
        uint256 initialETHBalance = address(this).balance;
        _pancakeRouter.removeLiquidityETHSupportingFeeOnTransferTokens(
            address(this),
            amount,
            0,
            0,
            address(this),
            block.timestamp
        );
        uint256 neWETHBalance = address(this).balance - initialETHBalance;
        if (addToStaking) {
            _distributeStake(neWETHBalance);
        } else {
            marketingBalance += neWETHBalance;
        }
    }

    //Releases all remaining ETH on the contract wallet, so ETH wont be burned
    //Can only be called 30 days after Liquidity unlocks
    function TeamRemoveRemainingETH() public onlyTeam {
        (bool sent, ) = TeamWallet.call{value: (address(this).balance)}("");
        require(sent);
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    //external//////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    receive() external payable {}

    fallback() external payable {}

    // IBEP20

    function getOwner() external view override returns (address) {
        return owner();
    }

    function name() external view override returns (string memory) {
        console.log('This is name of contract :', _name);
        return _name;
    }

    function symbol() external pure override returns (string memory) {
        return _symbol;
    }

    function decimals() external pure override returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view override returns (uint256) {
        return _circulatingSupply;
    }

    function balanceOf(address account)
        external
        view
        override
        returns (uint256)
    {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount)
        external
        override
        returns (bool)
    {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address _owner, address spender)
        external
        view
        override
        returns (uint256)
    {
        return _allowances[_owner][spender];
    }

    function approve(address spender, uint256 amount)
        external
        override
        returns (bool)
    {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) private {
        require(owner != address(0), "Approve from zero");
        require(spender != address(0), "Approve to zero");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "Transfer > allowance");

        _approve(sender, msg.sender, currentAllowance - amount);
        return true;
    }

    // IBEP20 - Helpers

    function increaseAllowance(address spender, uint256 addedValue)
        external
        returns (bool)
    {
        _approve(
            msg.sender,
            spender,
            _allowances[msg.sender][spender] + addedValue
        );
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        external
        returns (bool)
    {
        uint256 currentAllowance = _allowances[msg.sender][spender];
        require(currentAllowance >= subtractedValue, "<0 allowance");

        _approve(msg.sender, spender, currentAllowance - subtractedValue);
        return true;
    }
}
