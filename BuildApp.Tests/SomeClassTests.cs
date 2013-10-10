using System;
using BuildApp.Models;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BuildApp.Tests
{
    [TestClass]
    public class SomeClassTests
    {
        [TestMethod]
        public void ItIsTrue()
        {
            var something = new SomeClass();
            something.SomeProperty.Should().BeFalse();
        }
    }
}
